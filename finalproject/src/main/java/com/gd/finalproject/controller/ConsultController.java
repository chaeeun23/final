package com.gd.finalproject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.ConsultReservationService;
import com.gd.finalproject.service.ConsultService;
import com.gd.finalproject.vo.ConsultReservation;
import com.gd.finalproject.vo.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ConsultController {
	@Autowired ConsultService consultService;
	@Autowired ConsultReservationService consultReservationService;
	
	//상담예약(회원) - form
	@GetMapping("/addConsultReservation")
	public String addConsultReservation(Model model, @AuthenticationPrincipal MemberDto memberDto, String userId) {
		log.debug(TeamColor.CE + "[ConsultController.addConsultReservation] memberDto : " + memberDto);
		userId=memberDto.getMemberId();
		log.debug(TeamColor.CE + "[ConsultController.addConsultReservation] userId : " + userId);
		model.addAttribute("memberDto",memberDto);
		model.addAttribute("userId", userId);
		
		return "/user/addConsultReservation";
	}
	
	//상담예약 리스트(회원)
	@GetMapping("/userConsultReservationList")
	public String userConsultReservationList(Model model, @RequestParam(value = "userId",  required=false) String userId) {
		log.debug(TeamColor.CE + "[ConsultController.userConsultReservationList] userId : " + userId);
		
		Map<String,Object> map = consultService.getUserConsultReservationList(userId);
		
		log.debug(TeamColor.CE + "[ConsultController.userConsultReservationList] map : " + map);
		
		map.forEach((key,value) -> model.addAttribute(key,value));
		
		return "/user/userConsultReservationList";
	}
	//상담예약(회원) - action
	@PostMapping("/addConsultReservation")
	public String addConsultReservaion(ConsultReservation consultReservation) {
		log.debug(TeamColor.CE + "[ConsultController.addConsultReservation] consultReservation : " + consultReservation);
		consultReservation.setConsultDate(consultReservation.getConsultDate()+" "+consultReservation.getConsultDateTime());
		log.debug(TeamColor.CE + "[ConsultController.addConsultReservation] consultReservation.getConsultDate() : " + consultReservation.getConsultDate());
		
		int insertConsultReservation  = consultService.addConsultReservation(consultReservation);
		
		return "redirect:/userConsultReservationOne?userId="+consultReservation.getUserId();
	}
	
	//상담예약상세정보(회원)
	@GetMapping("/userConsultReservationOne")
	public String getUserConsultReservationOne(Model model, @RequestParam(value = "userId") String userId) {
		log.debug(TeamColor.CE + "[ConsultController.getUserConsultReservationOne] userId : " + userId);
		
		Map<String,Object> map = consultService.getUserConsultReservationOne(userId);
		
		log.debug(TeamColor.CE + "[ConsultController.getUserConsultReservationOne] map : " + map);
		
		model.addAttribute("map", map);
		return "/user/userConsultReservationOne";
	}
	
	//상담예약수정(회원) - form
	@GetMapping("/modifyConsultReservation")
	public String modifyConsultReservation(Model model, @RequestParam(value = "consultReservationNo") int consultReservationNo) {
		log.debug(TeamColor.CE + "[ConsultController.modifyConsultReservation] consultReservationNo : " + consultReservationNo);

		//상세에서 정보가져오기
		Map<String, Object> map = consultReservationService.getConsultReservationOne(consultReservationNo);
		log.debug(TeamColor.CE + "[ConsultController.modifyConsultReservation] map : " + map);
		
		model.addAttribute("map", map);
		
		return "/user/modifyConsultReservation";	
	}
	
	
	  //상담예약수정(회원) - action
	  @PostMapping("/modifyConsultReservation") 
	  public String modifyConsultReservation(ConsultReservation consultReservation) {
		  log.debug(TeamColor.CE + "[ConsultController.modifyConsultReservation] consultReservation : " + consultReservation);
		  consultReservation.setConsultDate(consultReservation.getConsultDate()+" "+consultReservation.getConsultDateTime());
			log.debug(TeamColor.CE + "[ConsultController.modifyConsultReservation] consultReservation.getConsultDate() : " + consultReservation.getConsultDate());
			
		  int updateConsultReservation = consultService.modifyConsultReservation(consultReservation);
		  
		  return "redirect:/userConsultReservationOne?userId="+consultReservation.getUserId();
	  }
	  
	  //상담예약삭제(회원)
	  @GetMapping("/removeConsultReservation")
	  public String removeConsultReservation(@RequestParam(value = "consultReservationNo") int consultReservationNo) {
		  log.debug(TeamColor.CE + "[ConsultController.removeConsultReservation] consultReservationNo : " + consultReservationNo);
		  
		  int removeConsultReservation = consultService.removeConsultReservation(consultReservationNo);
		  
		  return "redirect:/index";
		  
	  }
	 
}
