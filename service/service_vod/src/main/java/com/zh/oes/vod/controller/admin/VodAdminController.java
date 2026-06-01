package com.zh.oes.vod.controller.admin;

import com.zh.oes.common.utils.Result;
import com.zh.oes.vod.service.VodService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Api(tags = "视频点播后台api接口")
@RestController
@RequestMapping("admin/vod")
public class VodAdminController {

    private VodService vodService;

    @Autowired
    public void setVodService(VodService vodService) {
        this.vodService = vodService;
    }

    @ApiOperation(value = "上传视频到本地")
    @PostMapping("upload")
    public Result uploadVideo(
            @ApiParam(name = "file", value = "要上传的视频文件", required = true)
            @RequestParam("file") MultipartFile file) {

        String videoPath = vodService.uploadVideo(file);
        return Result.success(videoPath);
    }

    @ApiOperation(value = "根据视频路径删除视频")
    @DeleteMapping("delete")
    public Result deleteVideo(
            @ApiParam(name = "videoPath", value = "视频路径", required = true)
            @RequestParam("videoPath") String videoPath) {

        vodService.deleteVideo(videoPath);
        return Result.success();
    }

    @ApiOperation(value = "远程调用：删除视频")
    @DeleteMapping("remoteDelete")
    public boolean remoteDelete(
            @RequestParam("videoPath") String videoPath) {

        vodService.deleteVideo(videoPath);
        return true;
    }

    @ApiOperation(value = "远程调用：批量删除视频")
    @DeleteMapping("remoteBatchDelete")
    public boolean remoteBatchDelete(
            @RequestParam("videoPathList") List<String> videoPathList) {

        vodService.batchDeleteVideo(videoPathList);
        return true;
    }
}
