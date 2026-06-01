package com.zh.oes.sms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("sms_verification_log")
public class SmsVerificationLog {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String phone;

    private String code;

    private LocalDateTime requestTime;

    private LocalDateTime expireTime;

    private Integer status; // 0有效 1已使用

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
