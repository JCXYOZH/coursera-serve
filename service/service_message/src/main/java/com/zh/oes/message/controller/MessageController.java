package com.zh.oes.message.controller;

import com.zh.oes.common.utils.JwtUtil;
import com.zh.oes.common.utils.Result;
import com.zh.oes.message.service.MessageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.PutMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Api(tags = "消息通知API接口")
@RestController
@RequestMapping("/api/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @ApiOperation(value = "获取未读消息数量")
    @GetMapping("/unread/count")
    public Result getUnreadCount(HttpServletRequest request) {
        String memberId = JwtUtil.getUserIdByJwtToken(request);
        if (memberId.isEmpty()) return Result.failure().message("未登录");
        int count = messageService.getUnreadCount(Long.valueOf(memberId));
        return Result.success(count);
    }

    @ApiOperation(value = "获取所有公告列表(含已读状态)")
    @GetMapping("/list")
    public Result getNoticeList(HttpServletRequest request) {
        String memberId = JwtUtil.getUserIdByJwtToken(request);
        if (memberId.isEmpty()) return Result.failure().message("未登录");
        return Result.success(messageService.getAllNotices(Long.valueOf(memberId)));
    }

    @ApiOperation(value = "标记单条公告为已读")
    @PostMapping("/read/{noticeId}")
    public Result markAsRead(@PathVariable Long noticeId, HttpServletRequest request) {
        String memberId = JwtUtil.getUserIdByJwtToken(request);
        if (memberId.isEmpty()) return Result.failure().message("未登录");
        boolean success = messageService.markAsRead(Long.valueOf(memberId), noticeId);
        return success ? Result.success() : Result.failure();
    }

    @ApiOperation(value = "发布新公告(测试用，供管理员调用触发推送)")
    @PostMapping("/publish")
    public Result publishNotice(@RequestBody Map<String, String> params) {
        String title = params.get("title");
        String content = params.get("content");
        boolean success = messageService.publishNotice(title, content);
        return success ? Result.success() : Result.failure();
    }

    @ApiOperation(value = "修改公告(测试用，触发推送)")
    @PutMapping("/update/{noticeId}")
    public Result updateNotice(@PathVariable Long noticeId, @RequestBody Map<String, String> params) {
        String title = params.get("title");
        String content = params.get("content");
        boolean success = messageService.updateNotice(noticeId, title, content);
        return success ? Result.success() : Result.failure();
    }
}
