package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.ReviewMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.PageNationDto;
import com.gd.finalproject.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ReviewService {
	@Autowired ReviewMapper reviewMapper;
	
	 
	// 리뷰 리스트(reviewList)
	public Map<String, Object> getReviewList(String lectureNo, String current) {
		// 페이지네이션 총 갯수
        int total = reviewMapper.getReviewTotal(lectureNo);
        log.debug(TeamColor.MS + "ReviewService(total) : " + total);
        
        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/reviewList", 5);
        log.debug(TeamColor.MS + "ReviewService(pageNation) : " + pageNation);

        // reviewList 가져오기
        List<Review> reviewList = reviewMapper.selectReviewList(lectureNo, pageNation.getBeginRow(),
                pageNation.getRowPerPage());
        log.debug(TeamColor.MS + "ReviewService(reviewList) : " + reviewList);

        // 객체 생성후 넣기
        Map<String, Object> map = new HashMap<>();
        map.put("pageNation", pageNation);
        map.put("reviewList", reviewList);

        return map;
		
	}
	
	/*
	 * // 리뷰 추가 (addReview - Form) public int addReview()
	 */
	
	// 리뷰 추가 (addReview - Action)
	public int addReview(String userId, Review review, String lectureNo) {
		 // 넘겨온 값
		 log.debug(TeamColor.MS + "ReviewService.addReview(review) : " + review);
		 log.debug(TeamColor.MS + "ReviewService.addReview(userId) : " + userId);
		 log.debug(TeamColor.MS + "ReviewService.addReview(lectureNo) : " + lectureNo);
		 
		 // 리뷰 추가하기
		 int add = reviewMapper.insertReview(userId, review, lectureNo);
		 log.debug(TeamColor.MS + "ReviewService.addReview(add) : " + add);
		 
		 return add;
	}

	
	// 리뷰 수정
	
	// 리뷰 삭제
	
	
}
