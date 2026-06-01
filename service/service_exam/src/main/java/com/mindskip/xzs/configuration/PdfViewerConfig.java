package com.mindskip.xzs.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.nio.file.Paths;

@Configuration
@RestController
public class PdfViewerConfig {

    @Value("${local.upload.path}")
    private String uploadPath;

    @GetMapping("/file/pdf/{fileName}")
    public ResponseEntity<FileSystemResource> servePdf(@PathVariable String fileName) {
        // 确保路径安全，只取文件名，防止目录穿越
        String safeFileName = Paths.get(fileName).getFileName().toString();
        File file = new File(uploadPath + "file/pdf/" + safeFileName);
        if (!file.exists()) {
            return ResponseEntity.notFound().build();
        }
        FileSystemResource resource = new FileSystemResource(file);
        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + safeFileName + "\"")
                .body(resource);
    }
}
