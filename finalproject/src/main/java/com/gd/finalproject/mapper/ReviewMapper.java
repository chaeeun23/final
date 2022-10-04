package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Review;

@Mapper
public interface ReviewMapper {
	
	// 리뷰 리스트(reviewList)
	List<Map<String,Object>> selectReviewList(@Param("lectureNo") String lectureNo, @Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 리뷰 리스트(reviewList) 페이징-Total
	int getReviewTotal(String lectureNo);
	
	// 리뷰 추가
	int insertReview(String userId, Review review, @Param("lectureNo") String lectureNo);
	
	// 리뷰 수정
	int updateReview(String userId, Review review, @Param("lectureNo") String lectureNo);
	
	// 리뷰 삭제
	int deleteReview(String userId, int reviewNo, @Param("lectureNo") String lectureNo);
}
