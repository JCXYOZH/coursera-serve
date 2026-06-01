package com.zh.oes.ucenter.controller.user;

import com.zh.oes.common.utils.Result;
import com.zh.oes.model.entity.app.AppVersion;
import com.zh.oes.ucenter.service.AppVersionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "APP版本管理")
@RestController
@RequestMapping("/user/app/version")
public class AppVersionController {

    @Autowired
    private AppVersionService versionService;

    @ApiOperation("获取最新版本")
    @GetMapping("/latest")
    public Result getLatestVersion() {
        AppVersion latestVersion = versionService.getLatestVersion();
        return Result.success(latestVersion);
    }
}
