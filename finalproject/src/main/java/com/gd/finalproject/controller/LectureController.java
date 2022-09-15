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
	
	// 강좌리스트
	@GetMapping("/lectureList")
	public String lectureList(Model model) {
		List<Map<String,Object>> lectureList = lectureService.getLectureList();
		System.out.println(lectureList);
		log.debug(TeamColor.YW+"Log test");
		log.debug(TeamColor.CE+"Log test");
		log.debug(TeamColor.MS+"Log test");
		log.debug(TeamColor.JM+"Log test");
		model.addAttribute("lectureList", lectureList);
		return "/admin/adminLectureList";
	}
}
