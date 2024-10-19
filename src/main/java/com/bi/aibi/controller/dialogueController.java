package com.bi.aibi.controller;

import cn.hutool.core.collection.CollUtil;
import com.bi.aibi.common.BaseResponse;
import com.bi.aibi.common.ResultUtils;
import com.bi.aibi.exception.BusinessException;
import com.bi.aibi.manager.AiManager;
import com.bi.aibi.model.dto.DialogueDTO;
import com.bi.aibi.model.entity.Dialogue;
import com.bi.aibi.model.entity.DialogueRoom;
import com.bi.aibi.model.enums.SparkEnum;
import com.bi.aibi.service.DialogueRoomService;
import com.bi.aibi.service.DialogueService;
import com.bi.aibi.utils.BeanUtils;
import com.bi.aibi.utils.StringUtils;
import com.bi.aibi.utils.UserContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/dialogue")
@Slf4j
public class dialogueController {

    private final DialogueService dialogueService;

    private final DialogueRoomService roomService;

    private final AiManager aiManager;

    @PostMapping("/list/{id}")
    public BaseResponse<List<Dialogue>> dialogueList(@PathVariable Long id) {
        List<Dialogue> list = dialogueService.lambdaQuery().eq(Dialogue::getRoomId, id).list();
        if (CollUtil.isEmpty(list)){
            return null;
        }
        return ResultUtils.success(list);
    }

    /**
     * AI对话
     * @param dto
     * @return
     */
    @PostMapping("/sendAi")
    public BaseResponse<Dialogue> senAi(@RequestBody DialogueDTO dto) {
        if (StringUtils.isEmpty(dto.getContent())){
            throw new RuntimeException("内容为空，请重新输入");
        }
        if (StringUtils.isBlank(dto.getContent())){
            throw new RuntimeException("内容为空，请重新输入");
        }
        Long userId = UserContext.getUser();
        Dialogue dialogue = BeanUtils.copyBean(dto, Dialogue.class);
        dialogue.setUserId(userId);
        dialogue.setTargetId(0L);
        dialogue.setType(SparkEnum.REQUEST);
        boolean save = dialogueService.save(dialogue);
        if (!save){
            throw new RuntimeException("系统错误");
        }
        roomService.lambdaUpdate().eq(DialogueRoom::getId, dto.getRoomId())
                .setSql("requestNum = requestNum + 1")
                .update();
        String result = aiManager.toSendSpark(dto.getContent());
        log.info("---------------------------------" );
        log.info("result:{}" + result);
        Dialogue responseDialogue = new Dialogue();
        responseDialogue.setContent(result);
        responseDialogue.setType(SparkEnum.RESPONSE);
        responseDialogue.setRoomId(dto.getRoomId());
        responseDialogue.setTargetId(dialogue.getId());
        responseDialogue.setUserId(userId);
        boolean save1 = dialogueService.save(responseDialogue);
        if (!save1){
            throw new RuntimeException("系统错误");
        }
        return ResultUtils.success(dialogueService.getById(responseDialogue.getId()));
    }
}
