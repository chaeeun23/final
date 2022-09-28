package com.gd.finalproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.CartMapper;
import com.gd.finalproject.mapper.PaymentMapper;
import com.gd.finalproject.vo.Cart;
import com.gd.finalproject.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	@Autowired CartMapper cartMapper;
	
	// 고객결제 리스트
	public List<Map<String,Object>> getUserPaymentList(String userId, String cartCheck/*, String lockerUse*/){
		// 파라미터 체크
		log.debug(TeamColor.YW + "getUserPaymentList.userId : " + userId);
		log.debug(TeamColor.YW + "getUserPaymentList.cartCheck : " + cartCheck);
//		log.debug(TeamColor.YW + "getUserPaymentList.lockerUse : " + lockerUse);
		String[] check = cartCheck.split(",");
		List<Map<String,Object>> payment = new ArrayList<Map<String,Object>>();
		for(String c:check) {
			payment.addAll(paymentMapper.selectUserPaymentList(c));	
		}
		//log.debug(TeamColor.YW + "getUserPaymentList.payment : " + payment);
		//List<Map<String,Object>> payment = paymentMapper.selectUserPaymentList(cartCheck);
		return payment;
		
	}
	
	// 결제내역 추가(결제목록 장바구니에서 삭제 포함)
	public boolean addUserPayment(String lectureNo, String userId, String payMethod) {
		// 파라미터 체크
		log.debug(TeamColor.YW + "addUserPayment.lectureNo : " + lectureNo);
		log.debug(TeamColor.YW + "addUserPayment.userId : " + userId);
		
		// 리턴값 세팅
		boolean result = false;
		
		// 장바구니에 들어온 lectureNo, userId 배열에 넣기
		String[] no = lectureNo.split(",");
		log.debug(TeamColor.YW + "addUserPayment.lectureNo : " + Arrays.toString(no));
		
		for(String n : no) {
			int insertUserPayment = paymentMapper.insertUserPayment(n, userId, payMethod);
			log.debug(TeamColor.YW + "addUserPayment.insertUserPayment : " + insertUserPayment);
			if(insertUserPayment>0) {
				int deleteUserCart = cartMapper.deleteUserCart(userId, n);
				log.debug(TeamColor.YW + "addUserPayment.deleteUserCart : " + deleteUserCart);
				result = true;
			}
		}
		
		
		
		// 실행여부 확인
		log.debug(TeamColor.YW + "addUserPayment.result : " + result);
		
		return result;
	}
}
