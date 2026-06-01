package com.zh.oes.vod.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface VodService {

    /**
     * 上传视频到本地存储
     * @param file 视频文件
     * @return 视频访问路径（例如 video/2026/02/23/xxx.mp4）
     */
    String uploadVideo(MultipartFile file);

    /**
     * 根据视频路径删除视频
     */
    void deleteVideo(String videoPath);

    /**
     * 批量删除视频
     */
    void batchDeleteVideo(List<String> videoPathList);
}
