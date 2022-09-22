package com.gd.finalproject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.ConsultReservationService;
import com.gd.finalproject.vo.Consult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ConsultReservationController {
	@Autowired
	ConsultReservationService consultReservationService;

	// consultReservationList 상담예약리스트(달력)
	@GetMapping("/consultReservationList")
	public String getConsultReservationList(Model model, @RequestParam(name = "year", defaultValue = "-1") int year,
			@RequestParam(name = "month", defaultValue = "-1") int month) {

		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationList] year : " + year);
		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationList] month : " + month);

		Map<String, Object> map = consultReservationService.getConsultReservationListByMonth(year, month);

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

	// consultReservationOne 상담예약상세보기
	@GetMapping("/consultReservationOne")
	public String getConsultReservationOne(Model model,
			@RequestParam(value = "consultReservationNo") int consultReservationNo) {
		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationOne] consultReservationNo : "
				+ consultReservationNo);

		Map<String, Object> map = consultReservationService.getConsultReservationOne(consultReservationNo);

		log.debug(TeamColor.CE + "[ConsultReservationController.getConsultReservationOne] map : " + map);
		model.addAttribute("map", map);

		return "/employee/consultReservationOne";
	}

	// addConsult 상담예약한 회원의 상담내역 추가 - form
	@GetMapping("/addConsult")
	public String addConsult(Model model, @RequestParam(value = "consultReservationNo") int consultReservationNo) {
		// 직원이름
		List<Map<String, Object>> employee = consultReservationService.addConsult();
		log.debug(TeamColor.CE + "[ConsultReservationController.addConsult] employee : " + employee);

		model.addAttribute("employee", employee);

		// 상세에서 정보가져오기
		Map<String, Object> consultReservationOne = consultReservationService
				.getConsultReservationOne(consultReservationNo);
		log.debug(TeamColor.CE + "[ConsultReservationController.addConsult] consultReservationOne : "
				+ consultReservationOne);

		model.addAttribute("consultReservationOne", consultReservationOne);

		return "/employee/addConsult";
	}

	// addConsult 상담예약한 회원의 상담내역 추가 - action
	@PostMapping("/addConsult")
	public String addConsult(Consult consult) {
		log.debug(TeamColor.CE + "[ConsultReservationController.addConsult] consult : " + consult);

		int addConsult = consultReservationService.addConsult(consult);

		return "redirect:/consultReservationList";
	}

	// modifyConsult 상담예약하고 상담한 내역 수정 - form
	@GetMapping("/modifyConsult")
	public String modifyConsult(Model model, @RequestParam(value = "consultReservationNo") int consultReservationNo) {
		log.debug(TeamColor.CE + "[ConsultReservationController.modifyConsult] consultReservationNo : "
				+ consultReservationNo);

		// 상세에서 정보가져오기
		Map<String, Object> consultReservationOne = consultReservationService
				.getConsultReservationOne(consultReservationNo);
		log.debug(TeamColor.CE + "[ConsultReservationController.modifyConsult] consultReservationOne : "
				+ consultReservationOne);

		model.addAttribute("consultReservationOne", consultReservationOne);

		return "/employee/modifyConsult";
	}
	
	// modifyConsult 상담예약하고 상담한 내역 수정 - action
	@PostMapping("/modifyConsult")
	public String modifyConsult(Consult consult) {
		log.debug(TeamColor.CE + "[ConsultReservationController.modifyConsult] consult : "
				+ consult);
		
		int updateConsult = consultReservationService.modifyConsult(consult);
		
		return "redirect:/consultReservationList";
	}

}
