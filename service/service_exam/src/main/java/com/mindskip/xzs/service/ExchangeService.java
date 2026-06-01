package com.mindskip.xzs.service;

import java.util.List;
import java.util.Map;
//import java.util.*;

public interface ExchangeService {
    List<Map<String, Object>> itemList(Integer userId); // 返回物品及用户是否已兑换等信息
    Map<String, Object> exchange(Integer userId, Integer itemId);
}
