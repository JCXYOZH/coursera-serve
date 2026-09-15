package com.zh.oes.vod.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "local.storage")
public class LocalStorageProperties {

    /**
     * 本地存储根路径
     */
//    private String rootPath = "E:\\Backups\\Data\\coursera";
    private String rootPath = "/data/coursera";

    public String getRootPath() {
        return rootPath;
    }

    public void setRootPath(String rootPath) {
        this.rootPath = rootPath;
    }
}
