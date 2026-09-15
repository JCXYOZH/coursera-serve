package com.zh.oes.message.mapper;

import com.zh.oes.message.entity.Notice;
import lombok.Data;

@Data
public class NoticeVO extends Notice {
    private Integer isRead; // 0未读 1已读
}
