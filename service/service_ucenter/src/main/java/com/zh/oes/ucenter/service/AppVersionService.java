package com.zh.oes.ucenter.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zh.oes.model.entity.app.AppVersion;

public interface AppVersionService extends IService<AppVersion> {
    // 获取最新版本
    AppVersion getLatestVersion();
}
