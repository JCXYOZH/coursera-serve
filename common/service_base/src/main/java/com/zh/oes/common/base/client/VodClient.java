package com.zh.oes.common.base.client;

import io.swagger.annotations.ApiParam;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Component
@FeignClient(name = "service-vod", fallback = VodClientHystrix.class)
public interface VodClient {

    // 删除单个视频（本地）
    @DeleteMapping("admin/vod/remoteDelete")
    boolean remoteDelete(
            @ApiParam(name = "videoPath", value = "视频路径", required = true)
            @RequestParam("videoPath") String videoPath);

    // 批量删除视频
    @DeleteMapping("admin/vod/remoteBatchDelete")
    boolean remoteBatchDelete(
            @ApiParam(name = "videoPathList", value = "视频路径列表", required = true)
            @RequestParam("videoPathList") List<String> videoPathList);
}
