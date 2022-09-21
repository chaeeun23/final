package com.gd.finalproject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.ConsultReservationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ConsultReservationController {
	@Autowired ConsultReservationService consultReservationService;
	
	//consultReservationList 상담예약리스트(달력)
	@GetMapping("/consultReservationList")
	public String getConsultReservationList(Model model
			, @RequestParam(name = "year", defaultValue = "-1") int year
			, @RequestParam(name = "month", defaultValue = "-1") int month) {
		
		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationList] year : " + year);
		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationList] month : " + month);
	
		Map<String,Object> map = consultReservationService.getConsultReservationListByMonth(year,month);
		
		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationList] map : " + map);
		
		model.addAttribute("consultReservationListByMonth", map.get("consultReservationListByMonth"));
		model.addAttribute("startBlank", map.get("startBlank"));
		model.addAttribute("endDay", map.get("endDay"));
		model.addAttribute("endBlank", map.get("endBlank"));
		model.addAttribute("totalTd", map.get("totalTd"));
		model.addAttribute("year", map.get("year"));
		model.addAttribute("month", map.get("month"));
		
		return "/employee/consultReservationList";
	
	}
	
	//consultReservationOne 상담예약상세보기 
	@GetMapping("/consultReservationOne")
	public String getConsultReservationOne(Model model, @RequestParam(value="consultReservationNo") int consultReservationNo) {
		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationOne] consultReservationNo : " + consultReservationNo);
		
		Map<String,Object> map = consultReservationService.getConsultReservationOne(consultReservationNo);
		
		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationOne] map : " + map);
		model.addAttribute("map", map);
		
		return "/employee/consultReservationOne";
	}
	
}
