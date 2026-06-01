package com.mindskip.xzs.service.impl;

import com.mindskip.xzs.domain.ExchangeItem;
import com.mindskip.xzs.domain.PointsLog;
import com.mindskip.xzs.repository.ExchangeMapper;
import com.mindskip.xzs.repository.PointsLogMapper;
import com.mindskip.xzs.repository.UserMapper;
import com.mindskip.xzs.service.ExchangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ExchangeServiceImpl implements ExchangeService {

    @Autowired
    private ExchangeMapper exchangeMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PointsLogMapper pointsLogMapper;

    @Override
    public List<Map<String, Object>> itemList(Integer userId) {
        List<ExchangeItem> items = exchangeMapper.getAllItems();
        List<Map<String, Object>> result = new ArrayList<>();
        for (ExchangeItem item : items) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", item.getId());
            map.put("name", item.getName());
            map.put("pointsRequired", item.getPointsRequired());
//            map.put("pdfPath", item.getPdfPath());
            map.put("pdfPath", item.getPdfPath() != null ? item.getPdfPath() : "");
            int exchanged = exchangeMapper.countUserExchange(userId, item.getId());
            map.put("exchanged", exchanged > 0);
            result.add(map);
        }
        return result;
    }

    @Override
    @Transactional
    public Map<String, Object> exchange(Integer userId, Integer itemId) {
        Map<String, Object> result = new HashMap<>();
        ExchangeItem item = exchangeMapper.getItemById(itemId);
        if (item == null) {
            result.put("success", false);
            result.put("message", "物品不存在");
            return result;
        }

        int alreadyExchanged = exchangeMapper.countUserExchange(userId, itemId);
        if (alreadyExchanged > 0) {
            result.put("success", false);
            result.put("message", "您已兑换过该物品");
            return result;
        }

        Integer points = userMapper.getPoints(userId);
        if (points == null) points = 0;
        if (item.getPointsRequired() > points) {
            result.put("success", false);
            result.put("message", "积分不足");
            return result;
        }

        userMapper.addPoints(userId, -item.getPointsRequired());
        exchangeMapper.insertExchangeRecord(userId, itemId, new Date());

        PointsLog log = new PointsLog();
        log.setUserId(userId);
        log.setPoints(-item.getPointsRequired());
        log.setType("exchange");
        log.setDescription("兑换物品：" + item.getName());
        log.setCreateTime(new Date());
        pointsLogMapper.insertPointsLog(log);

        result.put("success", true);
        result.put("message", "兑换成功");
        result.put("pdfPath", item.getPdfPath());
        return result;
    }
}
