package com.mindskip.xzs.service;

import com.mindskip.xzs.domain.User;
import java.util.Map;

public interface SignService {
    Map<String, Object> sign(User currentUser);
    Map<String, Object> getSignInfo(User currentUser);
    Map<String, Object> invite(User currentUser, String inviteeMobile);
}
