package com.zh.oes.message.service.impl;

import com.zh.oes.message.entity.Notice;
import com.zh.oes.message.entity.NoticeRead;
import com.zh.oes.message.mapper.NoticeMapper;
import com.zh.oes.message.mapper.NoticeReadMapper;
import com.zh.oes.message.mapper.NoticeVO;
import com.zh.oes.message.service.MessageService;
import com.zh.oes.message.websocket.NoticeWebSocket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import java.util.Date;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Autowired
    private NoticeReadMapper noticeReadMapper;

    @Autowired
    private NoticeWebSocket noticeWebSocket;

    @Override
    public int getUnreadCount(Long memberId) {
        return noticeMapper.getUnreadCount(memberId);
    }

    @Override
    public List<NoticeVO> getAllNotices(Long memberId) {
        return noticeMapper.getAllNoticesWithReadStatus(memberId);
    }

    @Override
    public boolean markAsRead(Long memberId, Long noticeId) {
        // 先查询是否已有阅读记录
        QueryWrapper<NoticeRead> wrapper = new QueryWrapper<>();
        wrapper.eq("member_id", memberId).eq("notice_id", noticeId);
        NoticeRead existRead = noticeReadMapper.selectOne(wrapper);

        if (existRead != null) {
            // 已有记录，更新 read_time 即可
            existRead.setReadTime(new Date());
            int update = noticeReadMapper.updateById(existRead);
            if (update > 0) {
                noticeWebSocket.sendUnreadCount(String.valueOf(memberId));
                return true;
            }
            return false;
        } else {
            // 没有记录，插入新记录
            NoticeRead read = new NoticeRead();
            read.setMemberId(memberId);
            read.setNoticeId(noticeId);
            read.setReadTime(new Date());
            int insert = noticeReadMapper.insert(read);
            if (insert > 0) {
                noticeWebSocket.sendUnreadCount(String.valueOf(memberId));
                return true;
            }
            return false;
        }
    }

    @Override
    public boolean publishNotice(String title, String content) {
        Notice notice = new Notice();
        notice.setTitle(title);
        notice.setContent(content);
        notice.setStatus(1);
        notice.setIsDeleted(0);
        int insert = noticeMapper.insert(notice);

        if (insert > 0) {
            // 发布新公告后，通知所有在线用户更新未读数量
            noticeWebSocket.sendUnreadCountToAll();
            return true;
        }
        return false;
    }

    @Override
    public boolean updateNotice(Long noticeId, String title, String content) {
        Notice notice = new Notice();
        notice.setId(noticeId);
        notice.setTitle(title);
        notice.setContent(content);
        // updateById 会触发 MyBatis-Plus 自动填充 update_time
        int update = noticeMapper.updateById(notice);
        if (update > 0) {
            // 公告更新后，通知所有在线用户重新获取未读数量
            noticeWebSocket.sendUnreadCountToAll();
            return true;
        }
        return false;
    }
}
