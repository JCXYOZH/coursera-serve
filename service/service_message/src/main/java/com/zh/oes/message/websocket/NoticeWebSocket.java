package com.zh.oes.message.websocket;

import com.zh.oes.common.utils.JwtUtil;
import com.zh.oes.message.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

@Component
@ServerEndpoint("/ws/message/{token}")
public class NoticeWebSocket {

    // 静态变量供 WebSocket 多例环境下使用
    public static NoticeMapper noticeMapper;

    // 通过 @Autowired 和 @PostConstruct 将 Spring 注入的实例赋给静态变量
    @Autowired
    private NoticeMapper autowiredNoticeMapper;

    @PostConstruct
    public void init() {
        NoticeWebSocket.noticeMapper = this.autowiredNoticeMapper;
    }

    private static ConcurrentHashMap<String, Session> sessionMap = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(@PathParam("token") String token, Session session) {
        String memberIdStr;
        try {
            memberIdStr = JwtUtil.getUserIdByJwtToken(token);
        } catch (Exception e) {
            // 捕获 JWT 过期等异常
            System.out.println("[WebSocket] Token解析失败或已过期: " + e.getMessage());
            try { session.close(); } catch (IOException ioException) { ioException.printStackTrace(); }
            return;
        }

        if (memberIdStr == null || memberIdStr.isEmpty()) {
            try { session.close(); } catch (IOException e) { e.printStackTrace(); }
            return;
        }

        String memberId = memberIdStr;
        sessionMap.put(memberId, session);
        System.out.println("[WebSocket] 用户 " + memberId + " 连接成功，当前在线人数: " + sessionMap.size());
        sendUnreadCount(memberId);
    }

    @OnClose
    public void onClose(@PathParam("token") String token) {
        String memberIdStr;
        try {
            memberIdStr = JwtUtil.getUserIdByJwtToken(token);
        } catch (Exception e) {
            return; // 如果Token过期，直接返回，不处理断开逻辑
        }

        if (memberIdStr != null && !memberIdStr.isEmpty()) {
            sessionMap.remove(memberIdStr);
            System.out.println("[WebSocket] 用户 " + memberIdStr + " 断开连接");
        }
    }

    @OnError
    public void onError(Throwable error) {
        error.printStackTrace();
    }

    // 向指定用户推送未读数量
    public void sendUnreadCount(String memberId) {
        Session session = sessionMap.get(memberId);
        if (session != null && session.isOpen()) {
            Long userId = Long.valueOf(memberId);
            int count = noticeMapper.getUnreadCount(userId);
            try {
                session.getBasicRemote().sendText(String.valueOf(count));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // 向所有在线用户推送未读数量 (当发布/修改公告时调用)
    public void sendUnreadCountToAll() {
        for (String memberId : sessionMap.keySet()) {
            sendUnreadCount(memberId);
        }
    }
}
