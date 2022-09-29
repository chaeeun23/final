package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.PaymentService;
import com.gd.finalproject.vo.MemberDto;
import com.gd.finalproject.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	@Autowired PaymentService paymentService;
	
	// 회원결제내역
	@GetMapping("/userPaymentHistory")
	public String userPaymentHistory(@AuthenticationPrincipal MemberDto memberDto, @RequestParam(required = false, value = "current") String current,
			@ModelAttribute("check") String check, Model model) {
		Map<String, Object> map = paymentService.getUserPaymentHistory(memberDto.getMemberId() ,current);
		log.debug(TeamColor.YW + "userPaymentHistory.map : " + map);
		map.forEach((key, value) -> model.addAttribute(key, value));

		return "/user/userPaymentHistory";
	}
	
	// 회원결제 리스트
	@PostMapping("/userPaymentList")
	public String userPaymentList(Model model, @AuthenticationPrincipal MemberDto memberDto, String cartCheck/*, String lockerUse*/) {
		// 파라미터 체크
		log.debug(TeamColor.YW + "userPaymentList.memberDto.getMemberId() : " + memberDto.getMemberId());
		//		log.debug(TeamColor.YW + "getUserPaymentList.lockerUse : " + lockerUse);	
		
		List<Map<String,Object>> userPaymentList = paymentService.getUserPaymentList(memberDto.getMemberId(),cartCheck);
		model.addAttribute("userPaymentList", userPaymentList);
		
		return "/user/userPaymentList";
	}
	
	// 결제내역 추가(결제목록 장바구니에서 삭제 포함)
	@PostMapping("/addUserPayment")
	public String addUserPayment(Model model, @AuthenticationPrincipal MemberDto memberDto, Payment payment) {
		// 파라미터 체크
		log.debug(TeamColor.YW + "addUserPayment.memberDto.getMemberId() : " + memberDto.getMemberId());
		log.debug(TeamColor.YW + "addUserPayment.payment : " + payment);
		
		// 실행
		boolean insertPayment = paymentService.addUserPayment(payment.getLectureNo(), memberDto.getMemberId(), payment.getPayMethod()); 
		log.debug(TeamColor.YW + "addUserPayment.insertPayment : " + insertPayment);
		
		// 임시로 cartList로 지정, 결제내역폼 만든 후 바꿀 예정
		return "redirect:/userCartList";
	}
	
	// 회원결제내역에서 환불상태 변경
	@PostMapping("/modifyRefundStatement")
	public @ResponseBody String modifyRefundStatement(@RequestParam(value = "courseNo") int courseNo, @RequestParam(value = "refund") String refund) {
		// 파라미터 체크
		log.debug(TeamColor.YW + "modifyRefundStatement.courseNo : " + courseNo);
		log.debug(TeamColor.YW + "modifyRefundStatement.refund : " + refund);
		
		// 실행
		boolean updateRefundStatement = paymentService.modifyRefundStatement(courseNo, refund);
		log.debug(TeamColor.YW + "modifyRefundStatement.refundPayment : " + updateRefundStatement);
		
		// ajax Json에 보낼 메시지
		String returnJson;
		
		// 실행값이 true일 경우 환불완료
		if(updateRefundStatement) {
			returnJson = "y";
		} else {
			returnJson = "n";
		}
		
		return returnJson;
	}
}
