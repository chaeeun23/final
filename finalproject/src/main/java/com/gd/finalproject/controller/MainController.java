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
	
	//프로그램안내 - 수영
	@GetMapping("/swimming")
	public String swimming() {
		return "/main_page/swimming";
	}
	
	//프로그램안내 - 에어로빅
	@GetMapping("/aerobics")
	public String aerobics() {
		return "/main_page/aerobics";
	}
	
	//프로그램안내 - 필라테스
	@GetMapping("/pilates")
	public String pilates() {
		return "/main_page/pilates";
	}
	
	//프로그램안내 - 테니스
	@GetMapping("/tennis")
	public String tennis() {
		return "/main_page/tennis";
	}
	
	//프로그램안내 - 탁구
	@GetMapping("/pingpong")
	public String pingpong() {
		return "/main_page/pingpong";
	}
}
