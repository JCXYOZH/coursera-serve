package com.zh.oes.model.vo.edu.admin;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@ApiModel(value = "CourseEsVO", description = "课程ES同步对象")
public class CourseEsVO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "课程ID")
    private Long id;

    @ApiModelProperty(value = "课程标题")
    private String title;

    @ApiModelProperty(value = "课程封面图片路径")
    private String cover;

    @ApiModelProperty(value = "课程描述")
    private String description;

    @ApiModelProperty(value = "课程销售价格")
    private BigDecimal price;

    @ApiModelProperty(value = "销售数量")
    private Long saleCount;

    @ApiModelProperty(value = "浏览数量")
    private Long viewCount;

    @ApiModelProperty(value = "总课时")
    private Integer lessonNum;

    // status 字段
    @ApiModelProperty(value = "课程状态 0未发布 1已发布")
    private Integer status;

    // 逻辑删除字段
    @ApiModelProperty(value = "逻辑删除 1已删除 0未删除")
    private Integer isDeleted;

    @ApiModelProperty(value = "课程讲师ID")
    private Long teacherId;

    @ApiModelProperty(value = "讲师姓名")
    private String teacherName;

    @ApiModelProperty(value = "一级分类id")
    private Long subjectId;

    @ApiModelProperty(value = "一级分类名称")
    private String subjectTitle;

    @ApiModelProperty(value = "二级分类id")
    private Long typeId;

    @ApiModelProperty(value = "二级分类名称")
    private String typeTitle;

    // 创建时间字段
    @ApiModelProperty(value = "创建时间")
    private java.util.Date createTime;
}
