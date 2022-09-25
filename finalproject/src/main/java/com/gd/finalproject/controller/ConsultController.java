package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.ConsultService;
import com.gd.finalproject.vo.ConsultReservation;
import com.gd.finalproject.vo.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ConsultController {
	@Autowired ConsultService consultService;
	
	//상담예약(회원) - form
	@GetMapping("/addConsultReservation")
	public String addConsultReservation(Model model, @AuthenticationPrincipal MemberDto memberDto) {
		log.debug(TeamColor.CE + "[ConsultController.addConsultReservation] memberDto : " + memberDto);

		model.addAttribute("memberDto",memberDto);
		return "/user/addConsultReservation";
	}
	
	//상담예약(회원) - action
	@PostMapping("/addConsultReservation")
	public int addConsultReservaion(ConsultReservation consultReservation) {
		log.debug(TeamColor.CE + "[ConsultController.addConsultReservation] consultReservation : " + consultReservation);

		int insertConsultReservation  = consultService.addConsultReservation(consultReservation);
		
		return insertConsultReservation;
	}
}
