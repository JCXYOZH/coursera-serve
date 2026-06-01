package com.zh.oes.auth.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zh.oes.model.entity.auth.UserRole;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface UserRoleService extends IService<UserRole> {

    // 启用或者禁用用户id为userId的角色
    void enableOrDisableUserRole(Long userId, Boolean isEnable);
}
