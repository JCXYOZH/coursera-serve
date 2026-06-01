package com.mindskip.xzs.service.impl;

import com.mindskip.xzs.service.FileUpload;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class FileUploadImpl implements FileUpload {

    @Value("${local.upload.path}")
    private String uploadPath;

    @Override
    public String uploadFile(InputStream inputStream, long size, String extName) {

        try {
            String datePath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());

            String fileName = UUID.randomUUID().toString().replace("-", "") + "." + extName;

            File dir = new File(uploadPath + "/file/" + datePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            File dest = new File(dir, fileName);

            FileOutputStream out = new FileOutputStream(dest);
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inputStream.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }
            out.close();
            inputStream.close();

            return "file/" + datePath + "/" + fileName;

        } catch (Exception e) {
            throw new RuntimeException("文件上传失败");
        }
    }
}
