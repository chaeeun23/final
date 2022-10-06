package com.gd.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.ReviewMapper;
import com.gd.finalproject.vo.Review;


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

	
	/*
	 * // 리뷰 추가 (addReview - Form) public int addReview()
	 */
	
	// 리뷰 추가 (addReview - Action)
	public int addReview(String userId, Review review, String lectureNo) {
		 // 넘겨온 값
		 log.debug(TeamColor.MS + "ReviewService.addReview(userId) : " + userId);
		 log.debug(TeamColor.MS + "ReviewService.addReview(review) : " + review);
		 log.debug(TeamColor.MS + "ReviewService.addReview(lectureNo) : " + lectureNo);
		 
		 // 리뷰 추가하기
		 int add = reviewMapper.insertReview(review, lectureNo);
		 log.debug(TeamColor.MS + "ReviewService.addReview(add) : " + add);
		 
		 return add;
	}

	
	// 리뷰 수정
	
	
	
	
	
	// 리뷰 삭제
	public int deleteReivew(int reviewNo) {
		// 값 확인
		 log.debug(TeamColor.MS + "ReviewService.removeReivew(reviewNo) : " + reviewNo);
		 
		 // 리뷰 삭제
		 int remove = reviewMapper.deleteReview(reviewNo);
		 log.debug(TeamColor.MS + "ReviewService.removeReivew(remove) : " + remove);
		
		return remove;
		}
	
	
}
