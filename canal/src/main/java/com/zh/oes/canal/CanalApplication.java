package com.zh.oes.canal;

import com.zh.oes.canal.client.CanalClient;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

import javax.annotation.Resource;

// 排除数据源自动配置，因为此微服务不再需要连接数据库
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class CanalApplication implements CommandLineRunner {

//    @Resource
    @javax.annotation.Resource
    private CanalClient canalClient;

    public static void main(String[] args) {
        SpringApplication.run(CanalApplication.class, args);
    }

    @Override
    public void run(String... strings) {
        // 使用新线程异步执行，避免连接失败导致整个应用启动失败
        new Thread(() -> {
            try {
                canalClient.run();
            } catch (Exception e) {
                System.err.println("Canal 客户端启动或连接失败，请检查 Canal 服务端 (11111端口) 是否正常启动: " + e.getMessage());
            }
        }).start();
    }
}
