package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface ReviewMapper {
	
	// 리뷰 리스트(reviewList)
	List<Map<String,Object>> selectReviewList(@Param("lectureNo") String lectureNo);
	
	// 리뷰 추가
	List<Map<String,Object>> insertReview(Map<String, Object> map);
	
	// 리뷰 수정
	int updateReview(@Param("reviewNo") int reviewNo);
	
	// 리뷰 삭제
	int deleteReview(@Param("reviewNo") int reviewNo);
}
