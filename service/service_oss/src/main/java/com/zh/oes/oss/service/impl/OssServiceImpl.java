package com.zh.oes.oss.service.impl;

import com.zh.oes.oss.service.OssService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService {

    @Value("${local.upload.path}")
    private String uploadPath;

    @Override
    public String uploadAvatarFile(MultipartFile file) {

        try {
            String datePath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());

            String originalFilename = file.getOriginalFilename();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
            String fileName = UUID.randomUUID().toString().replace("-", "") + suffix;

            File dir = new File(uploadPath + "/image/" + datePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            File dest = new File(dir, fileName);
            file.transferTo(dest);

            return "image/" + datePath + "/" + fileName;

        } catch (Exception e) {
            throw new RuntimeException("上传失败");
        }
    }
}
