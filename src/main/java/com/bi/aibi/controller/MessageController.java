package com.bi.aibi.controller;


import com.bi.aibi.common.BaseResponse;
import com.bi.aibi.common.ResultUtils;
import com.bi.aibi.model.dto.message.MessageDto;
import com.bi.aibi.model.entity.Message;
import com.bi.aibi.service.IMessageService;
import com.bi.aibi.utils.UserContext;
import lombok.RequiredArgsConstructor;
import org.redisson.RedissonSubList;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lishuo
 * @since 2024-09-16
 */
@RestController
@RequestMapping("/message")
@RequiredArgsConstructor
public class MessageController {

    private final IMessageService messageService;

    @PostMapping("/add")
    public void addMessage(@RequestBody MessageDto dto){
        Message one = new Message();
        one.setMessage(dto.getMessage());
        Long userId = UserContext.getUser();
        one.setUserId(userId);
        boolean save = messageService.save(one);
        if (!save){
            throw new RuntimeException("提交失败");
        }
    }

    @GetMapping("/list")
    public BaseResponse<List<Message>> list(){
        return ResultUtils.success(messageService.list());
    }

}
