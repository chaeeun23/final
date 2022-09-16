package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.LectureService;
import com.gd.finalproject.vo.Lecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	
	// 강좌 리스트
	@GetMapping("/employeeLectureList")		
	public String lectureList(@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check, Model model) {
	Map<String,Object> map = lectureService.getLectureList(current);
		log.debug(TeamColor.MS + "LectureController(employeeLectureList) : " + map);
		map.forEach((key, value) -> model.addAttribute(key, value));
		return "/employee/lectureList";		// 경로
	}
	
	// 강좌 상세페이지
	@GetMapping("/lectureOne") 
	public String lectureOne(Model model, @RequestParam(value="lectureNo") String lectureNo) {
		log.debug(TeamColor.MS + "LectureController(lectureOne-lectureNo) : " + lectureNo);
		Map<String,Object> lectureOne = lectureService.getLectureOne(lectureNo);
		log.debug(TeamColor.MS + "LectureController(lectureOne) : " + lectureOne);
		model.addAttribute("lectureOne", lectureOne);
		return "/employee/lectureOne";
	}
	
	
	
	
	
}
