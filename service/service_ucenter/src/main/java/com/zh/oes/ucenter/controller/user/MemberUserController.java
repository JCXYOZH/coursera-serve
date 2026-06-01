package com.zh.oes.ucenter.controller.user;

import com.zh.oes.common.utils.JwtUtil;
import com.zh.oes.common.utils.Result;
import com.zh.oes.model.entity.ucenter.Member;
import com.zh.oes.model.vo.edu.user.MemberVO;
import com.zh.oes.model.vo.ucenter.user.LoginVO;
import com.zh.oes.model.vo.ucenter.user.PasswordVO;
import com.zh.oes.model.vo.ucenter.user.RegisterVO;
import com.zh.oes.ucenter.service.MemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Api(tags = "用户后台api接口")
@RestController
@RequestMapping("user/ucenter/member")
public class MemberUserController {

    private MemberService memberService;

    @Autowired
    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

    @ApiOperation("检查手机号是否已注册")
    @GetMapping("/checkMobile/{mobile}")
    public Result checkMobile(@PathVariable String mobile) {

        long count = memberService.lambdaQuery()
                .eq(Member::getMobile, mobile)
                .count();

        Map<String, Object> map = new HashMap<>();
        map.put("isRegistered", count > 0);

        return Result.success().data(map);
    }

    @ApiOperation(value = "用户登录")
    @PostMapping("userLogin")
    public Result userLogin(@Validated @RequestBody LoginVO loginVO) {
        String token = memberService.userLogin(loginVO);
        return Result.success(token);
    }

    @ApiOperation(value = "用户注册")
    @PostMapping("userRegister")
    public Result userRegister(@Validated @RequestBody RegisterVO registerVO) {
        memberService.userRegister(registerVO);
        return Result.success();
    }

    @ApiOperation(value = "根据token获取用户信息")
    @GetMapping("getUserInfo")
    public Result getUserInfo(HttpServletRequest request) {

        String token = request.getHeader("token");
        String memberId = JwtUtil.getUserIdByJwtToken(token);

        Member member = memberService.getById(memberId);
        if (member == null) {
            return Result.failure().message("用户未登录");
        }

        member.setPassword("");
        return Result.success(member);
    }

    @ApiOperation(value = "修改用户信息")
    @PostMapping("updateUserInfo")
    public Result updateUserInfo(@Validated @RequestBody Member updateMember,
                                 HttpServletRequest request) {

        String token = request.getHeader("token");
        String memberId = JwtUtil.getUserIdByJwtToken(token);

        Member member = memberService.getById(memberId);
        if (member == null) {
            return Result.failure().message("用户未登录,请重新登录")
                    .code(Result.USER_AUTH_CODE);
        }

        if (!updateMember.getId().equals(member.getId())) {
            return Result.failure().message("修改用户和当前登录用户不同")
                    .code(Result.USER_AUTH_CODE);
        }

        updateMember.setPassword(member.getPassword());

        return memberService.updateById(updateMember) ?
                Result.success() : Result.failure();
    }

    @ApiOperation(value = "更改密码")
    @PostMapping("updatePassword")
    public Result updatePassword(@Validated @RequestBody PasswordVO passwordVO,
                                 HttpServletRequest request) {

        String token = request.getHeader("token");
        String memberId = JwtUtil.getUserIdByJwtToken(token);

        Member member = memberService.getById(memberId);
        if (member == null) {
            return Result.failure().message("用户未登录")
                    .code(Result.USER_AUTH_CODE);
        }

        memberService.updatePassword(passwordVO, member);

        return Result.success().message("修改密码成功");
    }

    @ApiOperation(value = "远程调用根据id获取用户信息")
    @GetMapping("remoteGetUser/{userId}")
    public MemberVO remoteGetUser(@PathVariable Long userId) {
        Member member = memberService.getById(userId);
        MemberVO memberVO = new MemberVO();
        BeanUtils.copyProperties(member, memberVO);
        return memberVO;
    }
}