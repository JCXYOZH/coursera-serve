package com.zh.oes.sms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zh.oes.sms.entity.SmsVerificationLog;
import com.zh.oes.sms.mapper.SmsVerificationLogMapper;
import com.zh.oes.sms.service.SmsVerificationLogService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class SmsVerificationLogServiceImpl
        extends ServiceImpl<SmsVerificationLogMapper, SmsVerificationLog>
        implements SmsVerificationLogService {

    @Override
    public boolean hasValidCode(String phone) {
        QueryWrapper<SmsVerificationLog> wrapper = new QueryWrapper<>();
        wrapper.eq("phone", phone)
                .eq("status", 0)
                .gt("expire_time", LocalDateTime.now())
                .last("limit 1");

        return this.getOne(wrapper) != null;
    }

    @Override
    public void saveCode(String phone, String code) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime expire = now.plusHours(24);

        SmsVerificationLog log = new SmsVerificationLog();
        log.setPhone(phone);
        log.setCode(code);
        log.setRequestTime(now);
        log.setExpireTime(expire);
        log.setStatus(0);

        this.save(log);
    }

    @Override
    public boolean validateCode(String phone, String code) {
        QueryWrapper<SmsVerificationLog> wrapper = new QueryWrapper<>();
        wrapper.eq("phone", phone)
                .eq("code", code)
                .eq("status", 0)
                .gt("expire_time", LocalDateTime.now())
                .last("limit 1");

        SmsVerificationLog log = this.getOne(wrapper);

        if (log == null) {
            return false;
        }

        log.setStatus(1);
        this.updateById(log);

        return true;
    }
}
