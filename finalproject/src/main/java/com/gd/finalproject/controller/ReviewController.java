package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReviewController {
	@Autowired ReviewService reviewService;
	
	// 리뷰 리스트(reviewList)
	@RequestMapping(value = "/reviewList" , method=RequestMethod.GET )
	public List<Map<String,Object>> reviewList(Model model, 
			@RequestParam(required = false, value = "lectureNo") String lectureNo) {
	
		// 디버깅 (값 넘겨 받기)
		log.debug(TeamColor.MS + "ReviewController.reviewList(lectureNo) : " + lectureNo);
		
		// 리뷰 리스트
		List<Map<String,Object>> reviewList = reviewService.getReviewList(lectureNo);
		log.debug(TeamColor.MS + "ReviewController.reviewList(reviewList) : " + reviewList); 

			return reviewList;
		}
	
	// 리뷰 삭제 (removeReview)
	@GetMapping("/removeReview")
	public int removeReivew(
			@RequestParam(required = false, value = "reviewNo") int reviewNo) {
		log.debug(TeamColor.MS + "ReviewService.removeReivew(reviewNo) : " + reviewNo);
		
		// 리뷰 삭제
		int removeReivew = reviewService.deleteReivew(reviewNo);
		
		return removeReivew;
	}
	
}
