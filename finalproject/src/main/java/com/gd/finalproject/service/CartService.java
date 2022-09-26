package com.gd.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.CartMapper;
import com.gd.finalproject.vo.Cart;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class CartService {
	@Autowired CartMapper cartMapper;
	
	// 장바구니(고객) 리스트
	public List<Cart> getUserCartList(String userId){
		// 파라미터 확인
		log.debug(TeamColor.YW + "getUserCartList.userId) : " + userId);
		
		// CartList 가져오기
		List<Cart> userCartList = cartMapper.selectUserCartList(userId);
		log.debug(TeamColor.YW + "getUserCartList.userCartList) : " + userCartList);
	
		return userCartList;
	}
	
	// 장바구니(고객) 삭제
	public int removeUserCart(String userId, String lectureNo) {
		// 파라미터 확인
		log.debug(TeamColor.YW + "removeUserCart.userId : " + userId);
		log.debug(TeamColor.YW + "removeUserCart.lectureNo : " + lectureNo);
		
		// deleteCart 실행
		int deleteUserCart = cartMapper.deleteUserCart(userId, lectureNo);
		log.debug(TeamColor.YW + "getUserCartList.deleteUserCart) : " + deleteUserCart);
		
		return deleteUserCart;
	}
}
