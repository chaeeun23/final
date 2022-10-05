package com.gd.finalproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.CartMapper;
import com.gd.finalproject.mapper.LockerMapper;
import com.gd.finalproject.mapper.PaymentMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.PageNationDto;
import com.gd.finalproject.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	@Autowired CartMapper cartMapper;
	@Autowired LockerMapper lockerMapper;
	
	// 회원결제내역
	public Map<String,Object> getUserPaymentHistory(String userId, String current){
		int total = paymentMapper.getUserPaymentTotal(userId);
		log.debug(TeamColor.YW + "getUserPaymentHistory.total : " + total);
		
		// 만들어논 메서드
		PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/userPaymentHistory", 10);
		log.debug(TeamColor.YW + "getUserPaymentHistory.pageNation : " + pageNation);
		
		List<Map<String,Object>> list = paymentMapper.selectUserPaymentHistory(userId, pageNation.getBeginRow(), pageNation.getRowPerPage());
		log.debug(TeamColor.YW + "getUserPaymentHistory.list : " + list);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageNation", pageNation);
		map.put("list", list);

		return map;
		
	}
	
	// 고객결제 리스트
	public List<Map<String,Object>> getUserPaymentList(String userId, String cartCheck){
		// 파라미터 체크
		log.debug(TeamColor.YW + "getUserPaymentList.userId : " + userId);
		log.debug(TeamColor.YW + "getUserPaymentList.cartCheck : " + cartCheck);
		
		// 배열값 쪼개서 넣기
		String[] cart = cartCheck.split(",");
		log.debug(TeamColor.YW + "getUserPaymentList.cart : " + Arrays.toString(cart));
		
		String[] locker = cartCheck.split(",");
		log.debug(TeamColor.YW + "getUserPaymentList.locker : " + Arrays.toString(locker));
		// lockerUse도 쪼개서 넣어야할듯..?
//		for(String l:locker) {
//			locker.addAll(lockerMapper.selectUserPaymentList(l));	
//		}
		
		List<Map<String,Object>> payment = new ArrayList<Map<String,Object>>();
		for(String c:cart) {
			payment.addAll(paymentMapper.selectUserPaymentList(c));	
		}
		
		return payment;
		
	}
	
	// 결제내역 추가(결제목록 장바구니에서 삭제 포함)
	public boolean addUserPayment(String userId, Payment payment, String lockerUse) {
		// 파라미터 체크
		log.debug(TeamColor.YW + "addUserPayment.userId : " + userId);
		log.debug(TeamColor.YW + "addUserPayment.payment : " + payment);
		log.debug(TeamColor.YW + "addUserPayment.lockerUse : " + lockerUse);
		
		// 리턴값 세팅
		boolean result = false;
		
		// 장바구니에 들어온 lectureNo, lockerUse 배열에 넣기
		String[] no = payment.getLectureNo().split(",");
		log.debug(TeamColor.YW + "addUserPayment.no[] : " + Arrays.toString(no));
		
		String[] locker = lockerUse.split(",");
		log.debug(TeamColor.YW + "addUserPayment.locker[] : " + Arrays.toString(locker));
		
		for(int i=0 ; i<no.length ; i++) {
			
			// 결제내역 추가
			int insertUserPayment = paymentMapper.insertUserPayment(no[i], userId, payment);
			log.debug(TeamColor.YW + "addUserPayment.insertUserPayment : " + insertUserPayment);
			
			// 사물함 체크 시 사물함 배정
			if(locker[i].equals("10000")) {
				log.debug(TeamColor.YW + "addUserPayment.locker[i] : " + locker[i]);
				int insertUserLocker = lockerMapper.insertLocker(payment.getCourseNo());
				log.debug(TeamColor.YW + "addUserPayment.insertUserLocker : " + insertUserLocker);
			}
			
			// 결제내역에 사물함번호 추가 및 결제금액 추가
			int updateUserPayment = paymentMapper.updateUserPayment(payment.getCourseNo());
			log.debug(TeamColor.YW + "addUserPayment.updateUserPayment : " + updateUserPayment);
			
			// 결제가 완료됐다면 장바구니에서 제거
			if(insertUserPayment>0) {
				int deleteUserCart = cartMapper.deleteUserCart(userId, no[i]);
				log.debug(TeamColor.YW + "addUserPayment.deleteUserCart : " + deleteUserCart);
				result = true;
			}
		}
		
		// 실행여부 확인
		log.debug(TeamColor.YW + "addUserPayment.result : " + result);
		
		return result;
	}
	
	// 회원결제내역에서 환불상태 변경
	public boolean modifyRefundStatement(int courseNo, String refund) {
		// 파라미터 체크
		log.debug(TeamColor.YW + "modifyRefundStatement.courseNo : " + courseNo);
		log.debug(TeamColor.YW + "modifyRefundStatement.refund : " + refund);
	
		// 리턴값 세팅
		boolean result = false;
		
		int updateRefundStatement = paymentMapper.updateRefundStatement(courseNo);
		log.debug(TeamColor.YW + "modifyRefundStatement.updateRefundStatement : " + updateRefundStatement);
		
		// 환불상태변경이 성공이라면
		if(updateRefundStatement==1) {
			result = true;
		}
		
		// 실행여부 확인
		log.debug(TeamColor.YW + "modifyRefundStatement.result : " + result);
		
		return result;
	}
}
