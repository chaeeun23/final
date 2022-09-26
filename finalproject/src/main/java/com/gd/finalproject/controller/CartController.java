package com.gd.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.CartService;
import com.gd.finalproject.vo.Cart;
import com.gd.finalproject.vo.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@Autowired CartService cartService;
	
	//장바구니 리스트 - form
	@GetMapping("/userCartList")
	public String userCartList(Model model, @AuthenticationPrincipal MemberDto memberDto) {
		List<Cart> userCartList = cartService.getUserCartList(memberDto.getMemberId());
		log.debug(TeamColor.YW + "userCartList.userCartList : " + userCartList);
		model.addAttribute("userCartList", userCartList);
		
		return "/user/cartList";
	}
	
	//장바구니 추가
	@GetMapping("/insertUserCart")
	public String insertUserCart(@AuthenticationPrincipal MemberDto memberDto, String lectureNo) {
		// 파라미터 확인
		log.debug(TeamColor.YW + "insertUserCart.memberDto.getMemberId()" + memberDto.getMemberId());
		log.debug(TeamColor.YW + "insertUserCart.memberDto.lectureNo" + lectureNo);
		
		int insertCart = cartService.insertUserCart(memberDto.getMemberId(), lectureNo);
		log.debug(TeamColor.YW + "insertUserCart.removeCart : " + insertCart);
		
		return "redirect:/userCartList";
	}
	
	//장바구니 삭제
	@GetMapping("/removeUserCart")
	public String removeUserCart(@AuthenticationPrincipal MemberDto memberDto, String lectureNo) {
		
		int removeCart = cartService.removeUserCart(memberDto.getMemberId(), lectureNo);
		log.debug(TeamColor.YW + "removeUserCart.removeCart : " + removeCart);
		
		return "redirect:/userCartList";
	}
}
