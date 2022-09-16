package com.gd.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping(value={"/","/main","/index"})
	public String index(Model model) {
		return "/main_page/index";
	}
}
