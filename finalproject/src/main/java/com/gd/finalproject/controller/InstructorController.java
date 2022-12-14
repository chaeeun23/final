package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.InstructorService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InstructorController {

	@Autowired
	InstructorService instructorService;

	// 강사 리스트
	@GetMapping("/instructorList")
	public String instructorList(@RequestParam(required = false, value = "current") String current,
			@ModelAttribute("check") String check, Model model) {
		Map<String, Object> map = instructorService.getInstructorList(current);
		log.debug(TeamColor.CE + "InstructorController(instructorList) : " + map);
		map.forEach((key, value) -> model.addAttribute(key, value));
		return "/commons/instructorList";
	}
	
	//강사 상세페이지
	@GetMapping("/instructorOne")
	public String instructorOne(Model model, @RequestParam(value="memberId") String memberId) {
		log.debug(TeamColor.CE + "InstructorController(instructorOne-memberId) : " + memberId);
		Map<String,Object> map = instructorService.getInstructorOne(memberId);
		log.debug(TeamColor.CE + "InstructorController(instructorOne-map) : " + map);
		model.addAttribute("map",map);
		return "/commons/instructorOne";
	}

}
