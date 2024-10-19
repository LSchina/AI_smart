package com.bi.aibi.controller;

import com.bi.aibi.common.BaseResponse;
import com.bi.aibi.common.ResultUtils;
import com.bi.aibi.model.dto.RoomDTO;
import com.bi.aibi.model.entity.DialogueRoom;
import com.bi.aibi.service.DialogueRoomService;
import com.bi.aibi.utils.CollUtils;
import com.bi.aibi.utils.UserContext;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.bi.aibi.common.ErrorCode.SYSTEM_ERROR;

@RestController
@RequestMapping("/room")
@RequiredArgsConstructor
public class dialogueRoomController {

    private final DialogueRoomService roomService;

    @GetMapping("/list")
    public BaseResponse<List<DialogueRoom>> RoomList() {
        Long userId = UserContext.getUser();
        List<DialogueRoom> list = roomService.lambdaQuery()
                .eq(DialogueRoom::getUserId, userId)
                .eq(DialogueRoom::getIsDelete, 0)
                .list();
        if (CollUtils.isEmpty(list)){
            return null;
        }
        return ResultUtils.success(list);
    }

    @PostMapping("/add")
    public BaseResponse<Boolean> addRoom(@RequestBody RoomDTO dto) {
        Long userId = UserContext.getUser();
        DialogueRoom dialogueRoom = new DialogueRoom();
        dialogueRoom.setUserId(userId);
        dialogueRoom.setTitle(dto.getTitle());
        boolean save = roomService.save(dialogueRoom);
        if (!save){
            return ResultUtils.error(SYSTEM_ERROR,"系统错误");
        }
        return ResultUtils.success(Boolean.TRUE);
    }

}
