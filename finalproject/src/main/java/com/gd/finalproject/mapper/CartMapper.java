package com.gd.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Cart;

@Mapper
public interface CartMapper {
	// 장바구니 중복여부 확인
	int selectCartCheck(@Param("userId") String userId, @Param("lectureNo") String lectureNo);
	
	// 장바구니 리스트
	List<Cart> selectUserCartList(String userId);
	
	// 장바구니 추가
	int insertUserCart(@Param("userId") String userId, String lectureNo);
	
	// 장바구니 삭제
	int deleteUserCart(@Param("userId") String userId, String lectureNo);
}	
