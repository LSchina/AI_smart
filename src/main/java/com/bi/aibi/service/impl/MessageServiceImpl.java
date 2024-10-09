package com.bi.aibi.service.impl;

import com.bi.aibi.model.entity.Message;
import com.bi.aibi.mapper.MessageMapper;
import com.bi.aibi.service.IMessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lishuo
 * @since 2024-09-16
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements IMessageService {

}
