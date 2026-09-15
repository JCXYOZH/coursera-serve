package com.zh.oes.message.service;

import com.zh.oes.message.mapper.NoticeVO;
import java.util.List;

public interface MessageService {
    int getUnreadCount(Long memberId);
    List<NoticeVO> getAllNotices(Long memberId);
    boolean markAsRead(Long memberId, Long noticeId);
    boolean publishNotice(String title, String content);
    boolean updateNotice(Long noticeId, String title, String content);
}
