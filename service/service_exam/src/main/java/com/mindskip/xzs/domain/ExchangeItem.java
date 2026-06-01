package com.mindskip.xzs.domain;

import java.util.Date;

public class ExchangeItem {
    private Integer id;
    private String name;
    private Integer pointsRequired;   // 保持 Integer，但 getter 做 null 安全处理
    private String pdfPath;
    private Date createTime;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Integer getPointsRequired() { return pointsRequired == null ? 0 : pointsRequired; }
    public void setPointsRequired(Integer pointsRequired) { this.pointsRequired = pointsRequired; }

    public String getPdfPath() { return pdfPath; }
    public void setPdfPath(String pdfPath) { this.pdfPath = pdfPath; }

    public Date getCreateTime() { return createTime; }
    public void setCreateTime(Date createTime) { this.createTime = createTime; }
}
