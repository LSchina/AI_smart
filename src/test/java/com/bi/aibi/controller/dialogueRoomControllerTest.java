package com.bi.aibi.controller;

import com.bi.aibi.annotation.AuthCheck;
import com.bi.aibi.service.DialogueRoomService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class dialogueRoomControllerTest {

    @Autowired
    DialogueRoomService roomService;

    @Test
    void roomList() {
        System.out.println(roomService.list());
    }
}