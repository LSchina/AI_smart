package com.bi.aibi.manager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RedisLimiterManagerTest {

    @Resource
    private RedisLimiterManager redisLimiterManager;

    @Test
    void daRateLimter() {

        int count = 5;

        for (int i = 0; i < count; i++) {
            redisLimiterManager.daRateLimter("test");
            System.out.println("第" + i + "次成功");
        }

    }
}