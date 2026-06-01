package com.mindskip.xzs.controller.student;

import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.User;
import com.mindskip.xzs.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/student/sign")
public class SignController extends BaseApiController {

    @Autowired
    private SignService signService;

    @PostMapping("/do")
    public RestResponse doSign() {
        User user = getCurrentUser();
        Map<String, Object> result = signService.sign(user);
        return RestResponse.ok(result);
    }

    @PostMapping("/info")
    public RestResponse signInfo() {
        User user = getCurrentUser();
        Map<String, Object> info = signService.getSignInfo(user);
        return RestResponse.ok(info);
    }

    @PostMapping("/invite")
    public RestResponse invite(@RequestParam String mobile) {
        User user = getCurrentUser();
        Map<String, Object> result = signService.invite(user, mobile);
        return RestResponse.ok(result);
    }
}
