package com.gd.finalproject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.LectureService;
import com.gd.finalproject.vo.Lecture;
import com.gd.finalproject.vo.LectureDay;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	
	// 강좌 리스트(lectureList)
	@GetMapping("/employeeLectureList")		
	public String lectureList(@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check, Model model) {
	Map<String,Object> map = lectureService.getLectureList(current);
		log.debug(TeamColor.MS + "LectureController(employeeLectureList) : " + map);
		map.forEach((key, value) -> model.addAttribute(key, value));
		return "/employee/lectureList";		// 경로
	}
	
	// 강좌 상세페이지(lectureListOne)
	@GetMapping("/lectureOne") 
	public String lectureOne(Model model, @RequestParam(value="lectureNo") String lectureNo) {
		log.debug(TeamColor.MS + "LectureController(lectureOne-lectureNo) : " + lectureNo);
		Map<String,Object> lectureOne = lectureService.getLectureOne(lectureNo);
		log.debug(TeamColor.MS + "LectureController(lectureOne) : " + lectureOne);
		model.addAttribute("lectureOne", lectureOne);
		return "/employee/lectureOne";
	}
	
	// 강좌 추가 (addLecture.jsp-Form)
	@GetMapping("/addLecture")
	public String addLecture() {
		return "/employee/addLecture";
	}
	
	// 강좌 추가 (addLecture.jsp-Action)
	@PostMapping("/addLecture")
	public String addLecture(Lecture lecture, LectureDay lectureDay) {
		int addLecture = lectureService.addLecture(lecture, lectureDay);
		log.debug(TeamColor.MS + "LectureController(addLecture) : " + addLecture);
		return "redirect:/employee/lectureList";
	}
	
	
	
	
	
	
	
	// 강좌 삭제(removeLecture)
	@GetMapping("/removeLecture")
	public String removeLecture(@RequestParam(value="lectureNo") String lectureNo) {
		int removeLecture = lectureService.removeLecture(lectureNo);
		log.debug(TeamColor.MS + "LectureController(removeLecture) : " + removeLecture);
		return "redirect:/employeeLectureList";
		
	}
	
	
}
