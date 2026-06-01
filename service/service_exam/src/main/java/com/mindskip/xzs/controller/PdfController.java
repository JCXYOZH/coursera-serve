package com.mindskip.xzs.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.nio.file.Paths;

@RestController
@RequestMapping("/api/public/pdf")
public class PdfController {

    @Value("${local.upload.path}")
    private String uploadPath;

    @GetMapping("/{fileName:.+}")   // 支持带扩展名的文件名
    public ResponseEntity<FileSystemResource> getPdf(@PathVariable String fileName) {
        // 防止路径穿越，只取文件名
        String safeName = Paths.get(fileName).getFileName().toString();
        File file = new File(uploadPath + "file/pdf/" + safeName);
        if (!file.exists()) {
            return ResponseEntity.notFound().build();
        }
        FileSystemResource resource = new FileSystemResource(file);
        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + safeName + "\"")
                .body(resource);
    }
}
