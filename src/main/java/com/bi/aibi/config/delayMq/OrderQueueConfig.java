package com.bi.aibi.config.delayMq;

import org.springframework.amqp.core.*;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;

@Configuration
public class OrderQueueConfig {
    // 普通交换机名称
    private static final String ORDER_EXCHANGE = "normal_order_exchange";

    // 死信交换机名称
    private static final String DEAD_EXCHANGE = "normal_dead_exchange";

    // 普通队列名称
    private static final String ORDER_QUEUE = "normal_order_queue";

    // 延迟队列名称
    private static final String DELAY_QUEUE = "normal_delay_queue";


    // 声名普通交换机
    @Bean("orderNormalExchange")
    public DirectExchange orderExchange() {
        return new DirectExchange(ORDER_EXCHANGE);
    }

    // 声名普通队列并与死信队列进行绑定
    @Bean("orderNormalDelayQueue")
    public Queue orderQueue() {
        HashMap<String, Object> param = new HashMap<>();
        // 30秒钟后成为死信
        param.put("x-message-ttl", 30000);
        // 设置死信交换机
        param.put("x-dead-letter-exchange", DEAD_EXCHANGE);
        // 设置死信routingKey
        param.put("x-dead-letter-routing-key", "expire");
        return QueueBuilder.durable(ORDER_QUEUE).withArguments(param).build();
    }

    // 普通队列与交换机绑定
    @Bean
    public Binding orderQueueBindingToOrderExchange(@Qualifier("orderNormalDelayQueue") Queue queue,
                                                    @Qualifier("orderNormalExchange") DirectExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with("normal_order");
    }

    // 声名死信交换机
    @Bean("deadDelayExchange")
    public DirectExchange deadExchange() {
        return new DirectExchange(DEAD_EXCHANGE);
    }

    // 声名延迟队列
    @Bean("delayDelayQueue")
    public Queue delayQueue() {
        return QueueBuilder.durable(DELAY_QUEUE).build();
    }

    // 死信队列与与死信交换机进行绑定
    @Bean
    public Binding DelayQueueBingingToDeadExchange(@Qualifier("delayDelayQueue") Queue queue,
                                                   @Qualifier("deadDelayExchange") DirectExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with("expire");
    }

}
