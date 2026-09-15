package com.zh.oes.canal.client;

import com.alibaba.otter.canal.client.CanalConnector;
import com.alibaba.otter.canal.client.CanalConnectors;
import com.alibaba.otter.canal.protocol.CanalEntry.*;
import com.alibaba.otter.canal.protocol.Message;
import com.google.protobuf.InvalidProtocolBufferException;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.net.InetSocketAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class CanalClient {

    @Resource
    private RabbitTemplate rabbitTemplate;

    private static final String EXCHANGE_NAME = "course.data.change";

    public void run() {
        // Canal 服务端 IP 和 端口（默认11111），destination 默认为 example
        CanalConnector connector = CanalConnectors.newSingleConnector(
                new InetSocketAddress("192.168.188.3", 11111), "example", "", "");
        int batchSize = 1000;
        try {
            connector.connect();
            /*// 只监听 coursera 库的 edu_course 表
            connector.subscribe("coursera.edu_course");*/
            // 订阅所有库所有表，避免正则不匹配导致收不到数据
            connector.subscribe(".*\\..*");
            connector.rollback();
            try {
                while (true) {
                    Message message = connector.getWithoutAck(batchSize);
                    long batchId = message.getId();
                    int size = message.getEntries().size();
                    if (batchId == -1 || size == 0) {
                        Thread.sleep(1000);
                    } else {
                        dataHandle(message.getEntries());
                    }
                    connector.ack(batchId);
                }
            } catch (InterruptedException | InvalidProtocolBufferException e) {
                e.printStackTrace();
            }
        } finally {
            connector.disconnect();
        }
    }

    private void dataHandle(List<Entry> entries) throws InvalidProtocolBufferException {
        for (Entry entry : entries) {
            if (EntryType.ROWDATA == entry.getEntryType()) {
                RowChange rowChange = RowChange.parseFrom(entry.getStoreValue());
                EventType eventType = rowChange.getEventType();
                String tableName = entry.getHeader().getTableName();

                // 只处理 edu_course 表的增删改
                if ("edu_course".equals(tableName)) {
                    for (RowData rowData : rowChange.getRowDatasList()) {
                        sendToMq(tableName, eventType, rowData);
                    }
                }
            }
        }
    }

    private void sendToMq(String tableName, EventType eventType, RowData rowData) {
        Map<String, String> msgMap = new HashMap<>();
        msgMap.put("table", tableName);
        msgMap.put("type", eventType.toString());

        // 获取变更的主键 ID
        List<Column> columns = (eventType == EventType.DELETE) ? rowData.getBeforeColumnsList() : rowData.getAfterColumnsList();
        for (Column column : columns) {
            if (column.getIsKey()) {
                msgMap.put("id", column.getValue());
                break;
            }
        }

        // 发送到 RabbitMQ 交换机，routing key 为 course.data.change
        rabbitTemplate.convertAndSend(EXCHANGE_NAME, "course.data.change", com.alibaba.fastjson.JSON.toJSONString(msgMap));
        System.out.println("[Canal -> MQ] 发送变更消息: " + msgMap);
    }
}
