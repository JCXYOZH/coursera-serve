package com.zh.oes.model.entity.app; // 也可放在ucenter下

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import java.util.Date;

@Data
@TableName("app_version")
public class AppVersion {
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    private String versionName;

    private Integer versionCode;

    private String downloadUrl;

    private String updateContent;

    private Boolean forceUpdate;

    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Boolean isDeleted;
}
