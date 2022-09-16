package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.LectureService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	
	// 강좌 리스트
	@GetMapping("/employeeLectureList")
	public String lectureList(Model model) {
		List<Map<String,Object>> lectureList = lectureService.getLectureList();
		log.debug(TeamColor.MS + lectureList);
		model.addAttribute("lectureList", lectureList);
		return "/employee/lectureList";
	}
	
	/*// 강좌 상세페이지
	@GetMapping("/lectureOne")
	public String lectureOne() {
		
	}
	
*/
}
