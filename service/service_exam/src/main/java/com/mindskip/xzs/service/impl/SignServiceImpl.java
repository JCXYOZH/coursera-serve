package com.mindskip.xzs.service.impl;

import com.mindskip.xzs.domain.*;
import com.mindskip.xzs.repository.*;
import com.mindskip.xzs.service.SignService;
import com.mindskip.xzs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

@Service
public class SignServiceImpl implements SignService {

    @Autowired
    private SignRecordMapper signRecordMapper;
    @Autowired
    private PointsLogMapper pointsLogMapper;
    @Autowired
    private InviteRecordMapper inviteRecordMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private StudentMemberMapper studentMemberMapper;   // 新增

    // 积分规则映射：连续天数 -> 积分
    private static final Map<String, Integer> RULES = new LinkedHashMap<>();
    static {
        RULES.put("1", 2);
        RULES.put("2-6", 1);
        RULES.put("7-8", 2);
        RULES.put("9-14", 1);
        RULES.put("15-21", 2);
        RULES.put("22-28", 3);
    }

    @Override
    @Transactional
    public Map<String, Object> sign(User currentUser) {
        Map<String, Object> result = new HashMap<>();
        Date today = java.sql.Date.valueOf(LocalDate.now());
        SignRecord todayRecord = signRecordMapper.getByUserIdAndDate(currentUser.getId(), today);
        if (todayRecord != null) {
            result.put("success", false);
            result.put("message", "今日已签到");
            return result;
        }

        Integer lastContinuousDays = signRecordMapper.getLastContinuousDays(currentUser.getId());
        int continuousDays = 1;
        Date yesterday = java.sql.Date.valueOf(LocalDate.now().minusDays(1));
        if (lastContinuousDays != null) {
            SignRecord yesterdayRecord = signRecordMapper.getByUserIdAndDate(currentUser.getId(), yesterday);
            if (yesterdayRecord != null) {
                continuousDays = lastContinuousDays + 1;
            }
        }
        if (continuousDays > 28) {
            continuousDays = 1;
        }

        int points = calcPoints(continuousDays);

        SignRecord record = new SignRecord();
        record.setUserId(currentUser.getId());
        record.setSignDate(today);
        record.setContinuousDays(continuousDays);
        record.setPointsEarned(points);
        record.setCreateTime(new Date());
        signRecordMapper.insert(record);

        userMapper.addPoints(currentUser.getId(), points);

        PointsLog log = new PointsLog();
        log.setUserId(currentUser.getId());
        log.setPoints(points);
        log.setType("sign");
        log.setDescription("签到奖励，连续第" + continuousDays + "天");
        log.setCreateTime(new Date());
        pointsLogMapper.insertPointsLog(log);

        // 查询最新积分
        Integer totalPoints = userMapper.getPoints(currentUser.getId());
        result.put("success", true);
        result.put("continuousDays", continuousDays);
        result.put("pointsEarned", points);
        result.put("totalPoints", totalPoints == null ? 0 : totalPoints);
        return result;
    }

    private int calcPoints(int continuousDays) {
        if (continuousDays == 1) return 2;
        if (continuousDays >= 2 && continuousDays <= 6) return 1;
        if (continuousDays >= 7 && continuousDays <= 8) return 2;
        if (continuousDays >= 9 && continuousDays <= 14) return 1;
        if (continuousDays >= 15 && continuousDays <= 21) return 2;
        if (continuousDays >= 22 && continuousDays <= 28) return 3;
        return 0;
    }

    @Override
    public Map<String, Object> getSignInfo(User currentUser) {
        Map<String, Object> info = new HashMap<>();
        // 从数据库查询最新积分，避免缓存问题
        Integer points = userMapper.getPoints(currentUser.getId());
        info.put("points", points == null ? 0 : points);
        // 今日是否签到
        Date today = java.sql.Date.valueOf(LocalDate.now());
        SignRecord todayRecord = signRecordMapper.getByUserIdAndDate(currentUser.getId(), today);
        info.put("isSigned", todayRecord != null);
        // 连续天数
        Integer continuousDays = signRecordMapper.getLastContinuousDays(currentUser.getId());
        if (continuousDays == null || todayRecord == null) {
            // 若今日未签到，检查昨天是否签到，否则连续天数为0
            continuousDays = 0;
            Date yesterday = java.sql.Date.valueOf(LocalDate.now().minusDays(1));
            SignRecord yesterdayRecord = signRecordMapper.getByUserIdAndDate(currentUser.getId(), yesterday);
            if (yesterdayRecord != null) {
                continuousDays = yesterdayRecord.getContinuousDays();
            }
        }
        info.put("continuousDays", continuousDays);
        return info;
    }

    @Override
    @Transactional
    public Map<String, Object> invite(User currentUser, String inviteeMobile) {
        Map<String, Object> result = new HashMap<>();

        // 不能邀请自己
        if (inviteeMobile.equals(currentUser.getUserName())) {
            result.put("success", false);
            result.put("message", "不能邀请自己");
            return result;
        }

        // 校验手机号是否在知新堂（student_member）存在
        int mobileCount = studentMemberMapper.countByMobile(inviteeMobile);
        if (mobileCount == 0) {
            result.put("success", false);
            result.put("message", "该账号不存在，请输入已注册账号");
            return result;
        }

        // 检查是否已被邀请
        int exist = inviteRecordMapper.countByMobile(inviteeMobile);
        if (exist > 0) {
            result.put("success", false);
            result.put("message", "该账号已被邀请");
            return result;
        }

        // 记录邀请
        InviteRecord record = new InviteRecord();
        record.setInviterId(currentUser.getId());
        record.setInviteeMobile(inviteeMobile);
        record.setStatus(1);
        record.setCreateTime(new Date());
        inviteRecordMapper.insert(record);

        // 加积分
        userMapper.addPoints(currentUser.getId(), 25);
        // 流水
        PointsLog log = new PointsLog();
        log.setUserId(currentUser.getId());
        log.setPoints(25);
        log.setType("invite");
        log.setDescription("邀请用户 " + inviteeMobile);
        log.setCreateTime(new Date());
        pointsLogMapper.insertPointsLog(log);

        result.put("success", true);
        result.put("message", "邀请成功，获得25积分");
        return result;
    }
}
