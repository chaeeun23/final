package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.ReviewMapper;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ReviewService {
	@Autowired ReviewMapper reviewMapper;
	
	// 리뷰 리스트(reviewList)
	public List<Map<String,Object>> getReviewList(String lectureNo) {
		log.debug(TeamColor.MS + "ReviewService(lectureNo) : " + lectureNo);
        
        // reviewList 가져오기
        List<Map<String,Object>> review = reviewMapper.selectReviewList(lectureNo);
        log.debug(TeamColor.MS + "ReviewService(review) : " + review);

        return review;
	}

	// 리뷰 추가 (addReview - Action)
	public int addReview(String reviewContent, String lectureNo, String reviewWriter) {
		 // 넘겨온 값
		 log.debug(TeamColor.MS + "ReviewService.addReview(reviewContent) : " + reviewContent);
		 log.debug(TeamColor.MS + "ReviewService.addReview(lectureNo) : " + lectureNo);
		 log.debug(TeamColor.MS + "ReviewService.addReview(reviewWriter) : " + reviewWriter);
		
		 
		 // 리뷰 추가하기
		 int add = reviewMapper.insertReview(reviewContent, lectureNo, reviewWriter);
		 log.debug(TeamColor.MS + "ReviewService.addReview(add) : " + add);
		 
		 return add;
	}

	
	// 리뷰 삭제
	public Map<String,Object> deleteReivew(int reviewNo) {
		// 값 확인
		 log.debug(TeamColor.MS + "ReviewService.removeReivew(reviewNo) : " + reviewNo);
		 
		 // 리뷰 삭제
		 int deleteReivew = reviewMapper.deleteReview(reviewNo);
		 log.debug(TeamColor.MS + "ReviewService.removeReivew(remove) : " + deleteReivew);
		
		 Map<String,Object> map = new HashMap<>();
		 map.put("deleteReivew", deleteReivew);
		 
		 
		return map;
		}
	
	
}
