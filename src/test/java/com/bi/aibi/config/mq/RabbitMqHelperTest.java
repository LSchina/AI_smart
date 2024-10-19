package com.bi.aibi.config.mq;

import com.bi.aibi.mq.MyMessageProducer;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.time.Duration;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RabbitMqHelperTest {

    @Resource
    private MyMessageProducer myMessageProducer;

    @Test
    void sendDelayMessage() {
        myMessageProducer.sendMessage(
                "normal_order_exchange",
                "normal_order",
                "lishuo521");
    }
}