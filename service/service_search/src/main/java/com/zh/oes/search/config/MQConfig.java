package com.zh.oes.search.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MQConfig {

    public static final String EXCHANGE = "course.data.change";
    public static final String QUEUE = "course.data.change.queue";
    public static final String ROUTING_KEY = "course.data.change";

    @Bean
    public DirectExchange courseExchange() {
        return new DirectExchange(EXCHANGE);
    }

    @Bean
    public Queue courseQueue() {
        return new Queue(QUEUE, true);
    }

    @Bean
    public Binding bindingCourse(Queue courseQueue, DirectExchange courseExchange) {
        return BindingBuilder.bind(courseQueue).to(courseExchange).with(ROUTING_KEY);
    }
}
