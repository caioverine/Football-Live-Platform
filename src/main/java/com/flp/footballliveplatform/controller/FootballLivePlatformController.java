package com.flp.footballliveplatform.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FootballLivePlatformController {

    @RequestMapping("/")
    String helloWorld() {
        return "Hello World!";
    }
}
