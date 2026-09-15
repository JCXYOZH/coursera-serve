package com.zh.oes.search.consumer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zh.oes.model.vo.edu.admin.CourseEsVO;
import com.zh.oes.search.client.EduClient;
import com.zh.oes.search.service.SearchService;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CourseMQConsumer {

    @Autowired
    private EduClient eduClient;

    @Autowired
    private SearchService searchService;

    @RabbitListener(queues = "course.data.change.queue")
    public void consume(String msg) {
        try {
            System.out.println("[MQ Consumer] 收到变更消息: " + msg);
            JSONObject data = JSON.parseObject(msg);
            String table = data.getString("table");
            String type = data.getString("type");
            Long courseId = data.getLong("id");

            if ("edu_course".equals(table) && courseId != null) {
                if ("DELETE".equals(type)) {
                    // 物理删除：直接删除ES文档
                    System.out.println("课程被物理删除，删除 ES 文档: " + courseId);
                    searchService.deleteCourseById(courseId);
                } else {
                    // INSERT 或 UPDATE：查询最新数据
                    // 注意：如果是逻辑删除，这里的 remoteGetCourseById 需要能查出 is_deleted=1 的数据才能判断
                    // 我们在 service_edu 的 SQL 中没有过滤 is_deleted，所以能查出来
                    CourseEsVO course = eduClient.remoteGetCourseById(courseId);
                    if (course != null) {
                        // 交给 syncCourseById 内部判断是更新还是删除
                        searchService.syncCourseById(course);
                        System.out.println("增量同步处理完成，课程ID: " + courseId);
                    } else {
                        // 如果查不到，也执行删除
                        searchService.deleteCourseById(courseId);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
