package com.mindskip.xzs.domain;

import java.util.Date;

public class InviteRecord {
    private Integer id;
    private Integer inviterId;
    private String inviteeMobile;
    private Integer status;
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInviterId() {
        return inviterId;
    }

    public void setInviterId(Integer inviterId) {
        this.inviterId = inviterId;
    }

    public String getInviteeMobile() {
        return inviteeMobile;
    }

    public void setInviteeMobile(String inviteeMobile) {
        this.inviteeMobile = inviteeMobile;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
