package com.gd.finalproject.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class TestController {

    @GetMapping("/session-test")
    public String sesstionTest(HttpSession httpSession) {
        httpSession.invalidate();
        return "ok";
    }

}
