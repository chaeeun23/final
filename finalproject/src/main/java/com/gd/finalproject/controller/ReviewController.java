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
import com.gd.finalproject.service.ReviewService;
import com.gd.finalproject.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	
	// 리뷰 리스트(lectureOne.jsp - reviewList)
	@GetMapping("/reviewList")		
	public String reviewList(@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check, Model model) {
		Map<String,Object> reviewList = reviewService.getReviewList(current);
		log.debug(TeamColor.MS + "ReviewController.reviewList : " + reviewList);
		reviewList.forEach((key, value) -> model.addAttribute(key, value));
		return "/commons/reviewList";		// 경로
	}
	
	// 리뷰 추가 (lectureOne.jsp - addReview) - Form
	@GetMapping("/addReview")
	public String addReview() {
		return "/commonse/addReview";
	}

	// 리뷰 추가 (lectureOne.jsp - addReview) - Action
	@PostMapping("/addReview")
	public String addReview(Review review) {
		int addReivew = reviewService.addReview(review);
		log.debug(TeamColor.MS + "ReviewController.addReivew : " + addReivew);
		return "redirect:/commonse/addReview";
	}
	
	// 리뷰 추가
	
	
	// 리뷰 삭제
	
}
