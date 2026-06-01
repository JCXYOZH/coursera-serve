package com.zh.oes.vod.service.impl;

import com.zh.oes.vod.service.VodService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
public class VodServiceImpl implements VodService {

    @Value("${vod.storage.root-path}")
    private String rootPath;

    @Override
    public String uploadVideo(MultipartFile file) {

        try {
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

            LocalDate now = LocalDate.now();
            String datePath = now.toString().replace("-", "/");

            String fileName = UUID.randomUUID().toString().replace("-", "") + extension;

            String relativePath = "video/" + datePath + "/" + fileName;

            File dest = new File(rootPath, relativePath);

            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }

            file.transferTo(dest);

            return relativePath;

        } catch (IOException e) {
            throw new RuntimeException("视频上传失败", e);
        }
    }

    @Override
    public void deleteVideo(String videoPath) {

        if (!StringUtils.hasText(videoPath)) return;

        File file = new File(rootPath, videoPath);

        if (file.exists()) {
            file.delete();
        }
    }

    @Override
    public void batchDeleteVideo(List<String> videoPathList) {

        if (videoPathList == null || videoPathList.isEmpty()) return;

        for (String path : videoPathList) {
            deleteVideo(path);
        }
    }
}
