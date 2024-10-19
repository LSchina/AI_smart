package com.bi.aibi.manager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class AiManagerTest {

    @Resource
    AiManager aiManager;

    @Test
    void doChat() {
        String result = aiManager.doChat("分析需求：分析近来一段时间的增长趋势/n原始数据：日期,日活\\n1,12\\n2,15\\n3,13\\n4,20\\n5,25\\n/n");
        System.out.println(result);
    }
    @Test
    void toSendSpark(){
        String response = aiManager.toSendSpark("给我推荐一些张杰的好听的歌曲");
        System.out.println(response);
    }

}