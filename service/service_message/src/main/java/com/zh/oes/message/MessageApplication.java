package com.zh.oes.message;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

// 排除 SecurityAutoConfiguration，避免请求被拦截导致 400 或 WS 连接失败
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@EnableDiscoveryClient
@MapperScan("com.zh.oes.message.mapper")
@ComponentScan(basePackages = "com.zh.oes")
public class MessageApplication {
    public static void main(String[] args) {
        SpringApplication.run(MessageApplication.class, args);
    }
}
