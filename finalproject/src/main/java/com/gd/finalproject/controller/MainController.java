package com.gd.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	//메인페이지
	@GetMapping(value={"/","/main","/index"})
	public String index() {
		return "/main_page/index";
	}
	
	//센터소개
	@GetMapping("/centerIntroduce")
	public String centerIntroduce() {
		return "/main_page/centerIntroduce";
	}
	
	//오시는길
	@GetMapping("/centerRoute")
	public String centerRoute() {
		return "/main_page/centerRoute";
	}
	
}
