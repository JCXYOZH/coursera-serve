package com.mindskip.xzs.configuration.spring.security;

import com.mindskip.xzs.context.WxContext;
import com.mindskip.xzs.domain.User;
import com.mindskip.xzs.domain.UserToken;
import com.mindskip.xzs.domain.enums.RoleEnum;
import com.mindskip.xzs.service.UserService;
import com.mindskip.xzs.service.UserTokenService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Component
public class TokenAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private UserTokenService userTokenService;
    @Autowired
    private UserService userService;
    @Autowired
    private WxContext wxContext;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        // 1. 如果 SecurityContext 已有认证或 token 为空，直接放行
        String token = request.getHeader("token");
        if (SecurityContextHolder.getContext().getAuthentication() != null || StringUtils.isBlank(token)) {
            filterChain.doFilter(request, response);
            return;
        }

        // 2. 校验 token 长度（沿用原逻辑）
        if (token.length() != 36) {
            filterChain.doFilter(request, response);
            return;
        }

        UserToken userToken = userTokenService.getToken(token);
        if (userToken == null) {
            filterChain.doFilter(request, response);
            return;
        }

        Date now = new Date();
        if (now.after(userToken.getEndTime())) {
            // token 过期，直接放行，后续 Security 会因未认证返回 401
            filterChain.doFilter(request, response);
            return;
        }

        User user = userService.getUserByUserName(userToken.getUserName());
        if (user == null) {
            filterChain.doFilter(request, response);
            return;
        }

        // 3. 手动绑定 RequestAttributes，确保 WxContext 等可用
        ServletRequestAttributes attributes = new ServletRequestAttributes(request, response);
        RequestContextHolder.setRequestAttributes(attributes);

        try {
            // 4. 设置微信上下文（兼容旧代码）
            wxContext.setContext(user, userToken);

            // 5. 构建 Spring Security 认证对象
            // 根据 role 整数值构建权限
            Integer roleCode = user.getRole(); // 1 = 学生, 3 = 管理员
            String roleName = (roleCode == 3) ? RoleEnum.ADMIN.getName() : RoleEnum.STUDENT.getName();
            List<GrantedAuthority> authorities = Collections.singletonList(
                    new SimpleGrantedAuthority("ROLE_" + roleName)
            );

            UsernamePasswordAuthenticationToken authentication =
                    new UsernamePasswordAuthenticationToken(user, null, authorities);
            SecurityContextHolder.getContext().setAuthentication(authentication);

            // 继续执行后续过滤器
            filterChain.doFilter(request, response);
        } finally {
            // 6. 清理 RequestAttributes，防止泄漏
            RequestContextHolder.resetRequestAttributes();
            // 注意：WxContext 的清理可以在这里添加，但拦截器未清理，可暂时保留
        }
    }
}
