package com.bi.aibi.service.impl;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.DigestUtils;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserServiceImplTest {

    /**
     * 盐值，混淆密码
     */
    public static final String SALT = "lishuo";

    @Test
    void userLogin() {
        String userPassword = "123456";
        String encryptPassword = DigestUtils.md5DigestAsHex((SALT + userPassword).getBytes());
        System.out.println(encryptPassword);
    }
}