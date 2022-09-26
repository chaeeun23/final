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
import com.gd.finalproject.service.ReviewService;
import com.gd.finalproject.vo.Lecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	@Autowired ReviewService reviewService;
	
	// 강좌 리스트(lectureList)
	@GetMapping("/lectureList")		
	public String lectureList(@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check, Model model) {
	Map<String,Object> lectureList = lectureService.getLectureList(current);
		log.debug(TeamColor.MS + "LectureController.lectureList : " + lectureList);
		lectureList.forEach((key, value) -> model.addAttribute(key, value));
		return "/commons/lectureList";		// 경로
	}
	
	// 강좌 상세페이지(lectureListOne), 리뷰리스트(reviewList)
	@GetMapping("/lectureOne") 
	public String lectureOne(Model model, @RequestParam(value="lectureNo") String lectureNo, 
			@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check) {
		// 값 넘겨 받기
		log.debug(TeamColor.MS + "LectureController.lectureOne(lectureNo) : " + lectureNo);
		
		// 강좌 상세페이지
		Map<String,Object> lectureOne = lectureService.getLectureOne(lectureNo);
		log.debug(TeamColor.MS + "LectureController.lectureOne(lectureOne) : " + lectureOne);
		
		// 강좌 리뷰리스트
		Map<String,Object> reviewList = reviewService.getReviewList(current);
		log.debug(TeamColor.MS + "LectureController.lectureOne(reviewList) : " + reviewList);
		
		model.addAttribute("lectureOne", lectureOne);
		model.addAttribute("reviewList", reviewList);
		
		return "/commons/lectureOne";
	}
	
	// 강좌 추가 (addLecture.jsp-Form)
	@GetMapping("/addLecture")
	public String addLecture(Model model) {
		
		// 강사 아이디 추출
		Map<String,Object> instructor = lectureService.addLecture();
		log.debug(TeamColor.MS + "LectureController.addLecture(instructor) : " + instructor);
		instructor.forEach((key, value) -> model.addAttribute(key, value));
		
		// 장소 추출
		Map<String,Object> location = lectureService.addLecture();
		log.debug(TeamColor.MS + "LectureController.addLecture(location) : " + location);
		location.forEach((key, value) -> model.addAttribute(key, value));
		
		return "/commons/addLecture";
	}
	
	
	// 강좌 추가 (addLecture.jsp-Action)
	@PostMapping("/addLecture")
	public String addLecture(Lecture lecture)  {
		// lecture에 값들 들어와 있는지 확인
		log.debug(TeamColor.MS + "LectureController.addLecture(lecture) : " + lecture);
		
		// 강좌 추가
		int addLecture = lectureService.addLecture(lecture);
		log.debug(TeamColor.MS + "LectureController.addLecture(addLecture) : " + addLecture);
		
		return "redirect:/lectureList";
	}

	
	// 강좌 수정 (modifyLecture.jsp - Form)
	@GetMapping("/modifyLecture")
	public String modifyLecture(Model model, @RequestParam(value="lectureNo") String lectureNo) {
		// 강좌번호 값 넘어 왔는지 확인
		log.debug(TeamColor.MS + "LectureController.modifyLecture(lectureNo) : " + lectureNo);
		
		// 강사 아이디 추출
		Map<String,Object> instructor = lectureService.addLecture();
		log.debug(TeamColor.MS + "LectureController.modifyLecture(instructor) : " + instructor);
		instructor.forEach((key, value) -> model.addAttribute(key, value));
				
		// 장소 추출
		Map<String,Object> location = lectureService.addLecture();
		log.debug(TeamColor.MS + "LectureController.modifyLecture(location) : " + location);
		location.forEach((key, value) -> model.addAttribute(key, value));
				
		// 강좌 상세페이지에서 값 받아오기
		Map<String,Object> lectureOne = lectureService.getLectureOne(lectureNo);
		model.addAttribute("lectureOne", lectureOne);
		return "/commons/modifyLecture";
	}
	
	// 강좌 수정 (modifyLecture.jsp - Action)
	@PostMapping("/modifyLecture")
	public String modifyLecture(Lecture lecture) {
		// 값 넘겨받기
		log.debug(TeamColor.MS + "LectureController.modifyLecture(lecture) : " + lecture);
		
		// 강좌 수정하기
		int updateLecture = lectureService.modifyLecture(lecture, lecture.getLectureNo());
		log.debug(TeamColor.MS + "LectureController.modifyLecture(updateLecture) : " + updateLecture);
		return "redirect:/lectureList";
	}
	  
	// 강좌 삭제(removeLecture)
	@GetMapping("/removeLecture")
	public String removeLecture(@RequestParam(value="lectureNo") String lectureNo) {
		int removeLecture = lectureService.removeLecture(lectureNo);
		log.debug(TeamColor.MS + "LectureController(removeLecture) : " + removeLecture);
		return "redirect:/lectureList";
	}
	
	
}
