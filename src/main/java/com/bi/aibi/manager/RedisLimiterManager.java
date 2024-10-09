package com.bi.aibi.manager;


import com.bi.aibi.common.ErrorCode;
import com.bi.aibi.exception.BusinessException;
import org.redisson.api.RRateLimiter;
import org.redisson.api.RateIntervalUnit;
import org.redisson.api.RateType;
import org.redisson.api.RedissonClient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RedisLimiterManager {

    @Resource
    private RedissonClient redissonClient;

    /**
     * 限流接口
     * 令牌桶限流
     */
    public void daRateLimter(String key){
        // 创建限流器
        RRateLimiter rateLimiter = redissonClient.getRateLimiter(key);
        // 设置限流器 以速率的方式进行限流，
        //RateType.OVERALL 表示速率限流
        rateLimiter.trySetRate(RateType.OVERALL,2,1, RateIntervalUnit.SECONDS);
        // 使用方法尝试获取一个令牌，如果获取成功，则返回true，否则返回false
        boolean b = rateLimiter.tryAcquire(1);
        if (!b){
            throw new BusinessException(ErrorCode.TOO_MANY_REQUEST);
        }
    }


}
