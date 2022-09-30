package com.gd.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Review;

@Mapper
public interface ReviewMapper {
	
	// 리뷰 리스트(reviewList)
	List<Review> selectReviewList(String lectureNo, @Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 리뷰 리스트(reviewList) 페이징-Total
	int getReviewTotal(String lectureNo);
	
	// 리뷰 추가
	int insertReview(String userId, Review review, String lectureNo);
	
	// 리뷰 수정
	int updateReview(String userId, Review review, String lectureNo);
	
	// 리뷰 삭제
	int deleteReview(String userId, int reviewNo, String lectureNo);
}
