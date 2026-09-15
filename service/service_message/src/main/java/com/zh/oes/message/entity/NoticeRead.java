package com.zh.oes.message.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
@TableName("ucenter_notice_read")
public class NoticeRead {
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;
    private Long memberId;
    private Long noticeId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date readTime;
}
