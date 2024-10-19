package com.bi.aibi.controller;

import com.bi.aibi.model.entity.Dialogue;
import com.bi.aibi.service.DialogueService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class dialogueControllerTest {

    @Autowired
    DialogueService dialogueService;

    @Test
    void dialogueList() {
        List<Dialogue> list = dialogueService.list();
        System.out.println(list);
    }
}