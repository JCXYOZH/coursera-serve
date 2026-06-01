package com.zh.oes.ucenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zh.oes.model.entity.app.AppVersion;
import com.zh.oes.ucenter.mapper.AppVersionMapper;
import com.zh.oes.ucenter.service.AppVersionService;
import org.springframework.stereotype.Service;

@Service
public class AppVersionServiceImpl extends ServiceImpl<AppVersionMapper, AppVersion> implements AppVersionService {

    @Override
    public AppVersion getLatestVersion() {
        // 按版本号降序取第一条（假设 versionCode 越大版本越新）
        LambdaQueryWrapper<AppVersion> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(AppVersion::getVersionCode)
                .last("limit 1");
        return this.getOne(wrapper);
    }
}
