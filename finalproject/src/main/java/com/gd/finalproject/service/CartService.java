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
	
	// 장바구니 중복여부 확인
	public int getCartCheck(String userId, String lectureNo) {
		// 파라미터 확인
		log.debug(TeamColor.YW + "getCartCheck.userId : " + userId);
		log.debug(TeamColor.YW + "getCartCheck.lectureNo : " + lectureNo);
		
		// 리턴값
		int cartCheck = cartMapper.selectCartCheck(userId, lectureNo);
		log.debug(TeamColor.YW + "getCartCheck.cartCheck) : " + cartCheck);
		
		return cartCheck; 
	}
	
	// 장바구니(고객) 추가
	public boolean insertUserCart(String userId, String lectureNo) {
		// 파라미터 확인
		log.debug(TeamColor.YW + "insertUserCart.userId : " + userId);
		log.debug(TeamColor.YW + "insertUserCart.lectureNo : " + lectureNo);
		
		// 리턴값 세팅
		boolean result = false;
		
		// 장바구니 중복여부 확인
		int cartCheck = cartMapper.selectCartCheck(userId, lectureNo);
		log.debug(TeamColor.YW + "getCartCheck.cartCheck) : " + cartCheck);
		
		// 장바구니 중복이 아니라면
		if(cartCheck==0) {
			// addUserCart 실행
			int addUserCart = cartMapper.insertUserCart(userId, lectureNo);
			log.debug(TeamColor.YW + "getUserCartList.addUserCart) : " + addUserCart);
			result = true;
		} 
		
		return result;
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
