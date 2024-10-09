package com.bi.aibi.common;

import cn.hutool.core.util.StrUtil;


import com.auth0.jwt.JWT;
import com.bi.aibi.constant.RedisConstant;
import com.bi.aibi.model.entity.User;
import com.bi.aibi.service.UserService;
import com.bi.aibi.utils.TokenUtils;
import com.bi.aibi.utils.UserContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.HandlerInterceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;


@Component
@Slf4j
@RequiredArgsConstructor
public class JwtInterceptor implements HandlerInterceptor {

    private final UserService userService;

    private final StringRedisTemplate redisTemplate;

    @Override
    public boolean preHandle(HttpServletRequest request, @NotNull HttpServletResponse response, @NotNull Object handler) {
        if (HttpMethod.OPTIONS.toString().equals(request.getMethod())) {
            System.out.println("OPTIONS请求，放行");
            return true;
        }
        log.info("url:{}",request.getRequestURI());
        String[] split = request.getRequestURI().split("/");
        if (split[1].trim().equals("image")){
            return true;
        }
        // 打印请求头信息
        String token = request.getHeader("Authorization");
        if (StrUtil.isBlank(token)) {
            token = request.getParameter("Authorization");
        }
        log.info("{}",token);
        // 执行认证
        if (StrUtil.isBlank(token)) {
            throw new RuntimeException("无token，请重新登录");
        }
        // 获取 token 中的adminId
        String adminId;
        User admin;
        try {
            adminId = JWT.decode(token).getAudience().get(0);
            // 根据token中的userid查询数据库
            admin = userService.getById(Long.parseLong(adminId));
        } catch (Exception e) {
            String errMsg = "token验证失败，请重新登录";
            log.error(errMsg + ", token=" + token, e);
            throw new RuntimeException(errMsg);
        }
        if (admin == null) {
            throw new RuntimeException("用户不存在，请重新登录");
        }
        //从redis中获取token，看是否过期
        String s = redisTemplate.opsForValue().get(RedisConstant.TOKEN_KEY + adminId);
        if (StrUtil.isBlank(s)) {
            throw new RuntimeException("token已过期，请重新登录");
        }
        UserContext.setUser(admin.getId());
        return true;
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        String s1 = TokenUtils.genToken("123456132", "123123");
        System.out.println(s1);
        List<String> audience = JWT.decode(s1).getAudience();
        System.out.println(audience);
        String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxODI0NzEzMTU5NjU1NTcxNDU3IiwiZXhwIjoxNzI1Mzc4MDk2fQ.hb2xXaHw3RfCUKE0V3xIx9k5bieTElcT52SIA-p3m00";
        String s = JWT.decode(token).getAudience().get(0);
        System.out.println(s);
    }

}
