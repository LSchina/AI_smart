package com.bi.aibi.mq;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class MyMessageProducerTest {

    @Resource
    private MyMessageProducer myMessageProducer;

    @Test
    void sendMessage() {

        myMessageProducer.sendMessage("code_exchange", "code_routingKey", "hello world");
    }

    @Test
    void sendMessageTest() {

        myMessageProducer.sendMessage(
                "code_exchange_test",
                "code_routing_key",
                "hello world");

    }
}