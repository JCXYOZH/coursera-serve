package com.mindskip.xzs.controller.student;

import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.User;
import com.mindskip.xzs.domain.UserToken;
import com.mindskip.xzs.service.ExchangeService;
import com.mindskip.xzs.service.UserService;
import com.mindskip.xzs.service.UserTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/api/student/exchange")
public class ExchangeController extends BaseApiController {

    @Autowired
    private ExchangeService exchangeService;
    @Autowired
    private UserTokenService userTokenService;
    @Autowired
    private UserService userService;

    @PostMapping("/list")
    public RestResponse list(HttpServletRequest request) {
        User user = resolveUser(request);
        if (user == null) {
            return RestResponse.fail(401, "用户未登录");
        }
        return RestResponse.ok(exchangeService.itemList(user.getId()));
    }

    @PostMapping("/do/{itemId}")
    public RestResponse doExchange(@PathVariable Integer itemId, HttpServletRequest request) {
        User user = resolveUser(request);
        if (user == null) {
            return RestResponse.fail(401, "用户未登录");
        }
        Map<String, Object> res = exchangeService.exchange(user.getId(), itemId);
        return RestResponse.ok(res);
    }

    private User resolveUser(HttpServletRequest request) {
        // 1. 优先从请求头 token 获取（小程序）
        String token = request.getHeader("token");
        if (token != null && !token.isEmpty()) {
            UserToken userToken = userTokenService.getToken(token);
            if (userToken != null && userToken.getUserId() != null) {
                User user = userService.selectById(userToken.getUserId());
                if (user != null) {
                    return user;
                }
            }
        }

        // 2. 否则从 SecurityContext 中获取用户名，再查库（Vue Cookie 认证）
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            // principal 可能是 org.springframework.security.core.userdetails.User
            String username = null;
            if (auth.getPrincipal() instanceof org.springframework.security.core.userdetails.User) {
                username = ((org.springframework.security.core.userdetails.User) auth.getPrincipal()).getUsername();
            } else if (auth.getPrincipal() instanceof String) {
                username = (String) auth.getPrincipal();
            }
            if (username != null) {
                // 使用 UserService 根据用户名获取完整的 User 对象
                User user = userService.getUserByUserName(username);
                if (user != null) {
                    return user;
                }
            }
        }
        return null;
    }
}
