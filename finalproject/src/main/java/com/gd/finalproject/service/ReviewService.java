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
	
	// 리뷰 리스트
	public Map<String, Object> getReviewList(String current) {
		// 페이지네이션 총 갯수
        int total = reviewMapper.getReviewTotal();
        log.debug(TeamColor.MS + "ReviewService(total) : " + total);

        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/lectureOne", 5);
        log.debug(TeamColor.MS + "ReviewService(pageNation) : " + pageNation);

        // lectureList 가져오기
        List<Review> reviewList = reviewMapper.selectReviewList(pageNation.getBeginRow(),
                pageNation.getRowPerPage());
        log.debug(TeamColor.MS + "ReviewService(reviewList) : " + reviewList);

        // 객체 생성후 넣기
        Map<String, Object> map = new HashMap<>();
        map.put("pageNation", pageNation);
        map.put("reviewList", reviewList);

        return map;
		
	}
	
	// 리뷰 추가
	public int addReview(Review review) {
		int addReview = reviewMapper.insertReview(review);
		log.debug(TeamColor.MS + "ReviewService(addReview) : " + addReview);
		return addReview;
	}
	
	// 리뷰 수정
	
	// 리뷰 삭제
	
	
}
