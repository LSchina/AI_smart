package com.bi.aibi.utils;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;

@SpringBootTest
public class RedisTest {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Test
    void test() {
        redisTemplate.opsForValue().set("name", "yupi");
        String name = redisTemplate.opsForValue().get("name");
        System.out.println(name);
    }

}
