package com.gd.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Cart;

@Mapper
public interface CartMapper {
	// 장바구니(고객) 리스트
	List<Cart> selectUserCartList(String userId);
	
	// 장바구니(고객) 추가
	int insertUserCart(@Param("userId") String userId, String lectureNo);
	
	// 장바구니(고객) 삭제
	int deleteUserCart(@Param("userId") String userId, String lectureNo);
}	
