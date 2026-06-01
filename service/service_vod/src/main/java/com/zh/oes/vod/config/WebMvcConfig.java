package com.zh.oes.vod.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private LocalStorageProperties storageProperties;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        String location = "file:" + storageProperties.getRootPath() + "/video/";

        registry.addResourceHandler("/video/**")
                .addResourceLocations(location)
                .setCachePeriod(3600);
    }
}
