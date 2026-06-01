package com.zh.oes.sms.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.zh.oes.sms.service.SmsService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@Service
public class SmsServiceImpl implements SmsService {

    @Value("${spug.push.url}")
    private String spugUrl;

    @Override
    public boolean getVerificationCode(String phone, String[] params) {

        String code = params[0];

        try {
            URL url = new URL(spugUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            conn.setDoOutput(true);

            JSONObject body = new JSONObject();
            body.put("name", "勤学用户");
            body.put("code", code);
            body.put("targets", phone);

            OutputStream os = conn.getOutputStream();
            os.write(body.toJSONString().getBytes("UTF-8"));
            os.flush();
            os.close();

            int responseCode = conn.getResponseCode();

            return responseCode == 200;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
