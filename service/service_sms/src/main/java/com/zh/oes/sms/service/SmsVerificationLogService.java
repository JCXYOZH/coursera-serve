package com.zh.oes.sms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zh.oes.sms.entity.SmsVerificationLog;

public interface SmsVerificationLogService extends IService<SmsVerificationLog> {

    boolean hasValidCode(String phone);

    void saveCode(String phone, String code);

    boolean validateCode(String phone, String code);
}
