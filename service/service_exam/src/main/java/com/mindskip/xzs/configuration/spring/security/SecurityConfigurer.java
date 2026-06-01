package com.mindskip.xzs.configuration.spring.security;

import com.mindskip.xzs.configuration.property.CookieConfig;
import com.mindskip.xzs.configuration.property.SystemConfig;
import com.mindskip.xzs.domain.enums.RoleEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.RequestContextFilter;

import java.util.Collections;
import java.util.List;


@Configuration
@EnableWebSecurity
public class SecurityConfigurer {

    /**
     * The type Form login web security configurer adapter.
     */
    @Configuration
    public static class FormLoginWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {

        private final SystemConfig systemConfig;
        private final LoginAuthenticationEntryPoint restAuthenticationEntryPoint;
        private final RestAuthenticationProvider restAuthenticationProvider;
        private final RestDetailsServiceImpl formDetailsService;
        private final RestAuthenticationSuccessHandler restAuthenticationSuccessHandler;
        private final RestAuthenticationFailureHandler restAuthenticationFailureHandler;
        private final RestLogoutSuccessHandler restLogoutSuccessHandler;
        private final RestAccessDeniedHandler restAccessDeniedHandler;

        @Autowired
        private TokenAuthenticationFilter tokenAuthenticationFilter;  // 注入 Token 认证过滤器

        /**
         * Instantiates a new Form login web security configurer adapter.
         *
         * @param systemConfig                     the system config
         * @param restAuthenticationEntryPoint     the rest authentication entry point
         * @param restAuthenticationProvider       the rest authentication provider
         * @param formDetailsService               the form details service
         * @param restAuthenticationSuccessHandler the rest authentication success handler
         * @param restAuthenticationFailureHandler the rest authentication failure handler
         * @param restLogoutSuccessHandler         the rest logout success handler
         * @param restAccessDeniedHandler          the rest access denied handler
         */
        @Autowired
        public FormLoginWebSecurityConfigurerAdapter(SystemConfig systemConfig, LoginAuthenticationEntryPoint restAuthenticationEntryPoint, RestAuthenticationProvider restAuthenticationProvider, RestDetailsServiceImpl formDetailsService, RestAuthenticationSuccessHandler restAuthenticationSuccessHandler, RestAuthenticationFailureHandler restAuthenticationFailureHandler, RestLogoutSuccessHandler restLogoutSuccessHandler, RestAccessDeniedHandler restAccessDeniedHandler) {
            this.systemConfig = systemConfig;
            this.restAuthenticationEntryPoint = restAuthenticationEntryPoint;
            this.restAuthenticationProvider = restAuthenticationProvider;
            this.formDetailsService = formDetailsService;
            this.restAuthenticationSuccessHandler = restAuthenticationSuccessHandler;
            this.restAuthenticationFailureHandler = restAuthenticationFailureHandler;
            this.restLogoutSuccessHandler = restLogoutSuccessHandler;
            this.restAccessDeniedHandler = restAccessDeniedHandler;
        }

        /**
         * @param http http
         * @throws Exception exception
         *                   csrf is the from submit get method
         */
        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.headers().frameOptions().disable();

            List<String> securityIgnoreUrls = systemConfig.getSecurityIgnoreUrls();
            String[] ignores = new String[securityIgnoreUrls.size()];
            http
                    // Token 认证过滤器（处理小程序 Token），必须在表单登录过滤器之前
                    .addFilterBefore(tokenAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
                    // 表单登录过滤器
                    .addFilterAt(authenticationFilter(), UsernamePasswordAuthenticationFilter.class)
                    .exceptionHandling().authenticationEntryPoint(restAuthenticationEntryPoint)
                    .and().authenticationProvider(restAuthenticationProvider)
                    .authorizeRequests()
                    // 放行手机号校验接口（无需登录）
                    .antMatchers("/api/student/user/checkMobile/**").permitAll()
                    // 放行兑换接口（已通过getCurrentUser验证登录，无需角色检查）
                    .antMatchers("/api/student/exchange/**").permitAll()
                    .antMatchers("/file/pdf/**", "/api/public/pdf/**").permitAll()
                    .antMatchers("/api/public/**").permitAll()
                    .antMatchers(securityIgnoreUrls.toArray(ignores)).permitAll()
                    .antMatchers("/api/admin/**").hasRole(RoleEnum.ADMIN.getName())
                    .antMatchers("/api/student/**").hasRole(RoleEnum.STUDENT.getName())
                    .anyRequest().permitAll()
                    .and().exceptionHandling().accessDeniedHandler(restAccessDeniedHandler)
                    .and().formLogin().successHandler(restAuthenticationSuccessHandler).failureHandler(restAuthenticationFailureHandler)
                    .and().logout().logoutUrl("/api/user/logout").logoutSuccessHandler(restLogoutSuccessHandler).invalidateHttpSession(true)
                    .and().rememberMe().key(CookieConfig.getName()).tokenValiditySeconds(CookieConfig.getInterval()).userDetailsService(formDetailsService)
                    .and().csrf().disable()
                    .cors();
        }


        /**
         * Cors configuration source cors configuration source.
         *
         * @return the cors configuration source
         */
        @Bean
        public CorsConfigurationSource corsConfigurationSource() {
            final CorsConfiguration configuration = new CorsConfiguration();
            configuration.setMaxAge(3600L);
            configuration.setAllowedOrigins(Collections.singletonList("*"));
            configuration.setAllowedMethods(Collections.singletonList("*"));
            configuration.setAllowCredentials(true);
            configuration.setAllowedHeaders(Collections.singletonList("*"));
            final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
            source.registerCorsConfiguration("/api/**", configuration);
            return source;
        }


        /**
         * Authentication filter rest login authentication filter.
         *
         * @return the rest login authentication filter
         * @throws Exception the exception
         */
        @Bean
        public RestLoginAuthenticationFilter authenticationFilter() throws Exception {
            RestLoginAuthenticationFilter authenticationFilter = new RestLoginAuthenticationFilter();
            authenticationFilter.setAuthenticationSuccessHandler(restAuthenticationSuccessHandler);
            authenticationFilter.setAuthenticationFailureHandler(restAuthenticationFailureHandler);
            authenticationFilter.setAuthenticationManager(authenticationManagerBean());
            authenticationFilter.setUserDetailsService(formDetailsService);
            return authenticationFilter;
        }


    }
}
