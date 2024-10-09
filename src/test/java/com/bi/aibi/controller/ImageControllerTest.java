package com.bi.aibi.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ImageControllerTest {

    private static final String IMAGE_URL = "image";


    @Test
    void getImage() throws IOException {

        String test = "/image/2120007b-debe-43cf-bcc7-83f6f6eb24bc.jpg";
        String[] split = test.split("/");
        System.out.println(split[0].trim());
        System.out.println(split[1].trim());
        System.out.println(split[2].trim());
    }
}