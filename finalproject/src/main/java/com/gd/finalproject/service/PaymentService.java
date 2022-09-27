package com.gd.finalproject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	
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
}
