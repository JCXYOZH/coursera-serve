package com.zh.oes.search.listener;

import com.zh.oes.search.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
public class SearchInitListener implements ApplicationListener<ApplicationReadyEvent> {

    @Autowired
    private SearchService searchService;

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        // 使用新线程异步执行，避免阻塞服务启动
        new Thread(() -> {
            try {
                System.out.println("【自动同步】服务启动完成，开始执行全量同步...");
                boolean success = searchService.syncAllCourseData();
                System.out.println("【自动同步】全量同步结束，结果: " + (success ? "成功" : "失败"));
            } catch (Exception e) {
                System.out.println("【自动同步】全量同步异常: " + e.getMessage());
            }
        }).start();
    }
}
