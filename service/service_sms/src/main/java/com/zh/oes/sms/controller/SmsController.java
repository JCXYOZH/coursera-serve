package com.zh.oes.sms.controller;

import com.zh.oes.common.utils.RandomUtil;
import com.zh.oes.common.utils.Result;
import com.zh.oes.sms.service.SmsService;
import com.zh.oes.sms.service.SmsVerificationLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.TimeUnit;

@Api(tags = "短信服务API")
@RestController
@RequestMapping("user/sms")
public class SmsController {

    @Autowired
    private SmsService smsService;

    @Autowired
    private SmsVerificationLogService logService;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @ApiOperation("获取验证码")
    @GetMapping("/getVerificationCode/{phone}")
    public Result getVerificationCode(@PathVariable String phone) {

        if (StringUtils.isEmpty(phone)) {
            return Result.failure().message("手机号不能为空");
        }

        // 检查是否已有未过期的有效验证码
        if (logService.hasValidCode(phone)) {
            return Result.success().message("验证码已发送，请勿重复申请");
        }

        String code = RandomUtil.getSixBitRandom();
        boolean isSend = smsService.getVerificationCode(phone, new String[]{code});
        if (!isSend) {
            return Result.failure().message("短信发送失败");
        }

        // 存储到数据库（用于24小时限制）
        logService.saveCode(phone, code);
        // 存储到Redis（用于验证，24小时过期）
        redisTemplate.opsForValue().set(phone, code, 24, TimeUnit.HOURS);

        return Result.success().message("验证码发送成功，24小时内有效");

    }
}
