package com.gd.finalproject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.EmployeePaymentService;
import com.gd.finalproject.service.SalesService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SalesController {
	@Autowired SalesService salesService;
	
	//전체 매출리스트 
	@GetMapping("/salesList")
	public String salesList(@RequestParam(required = false, value = "current") String current,
			@ModelAttribute("check") String check, Model model) {
		Map<String, Object> map = salesService.getSalesList(current);
		log.debug(TeamColor.CE + "[SalesController.salesList] map : " + map);
		map.forEach((key, value) -> model.addAttribute(key, value));

		return "/employee/salesList";
	}
	
	//과목별 매출리스트
	@GetMapping("/lectureSalesList")
	public String lectureSalesList(@RequestParam(required = false, value = "current") String current,
			@ModelAttribute("check") String check, Model model, @RequestParam(value="lectureName", required=false) String lectureName) {
		log.debug(TeamColor.CE + "[SalesController.lectureSalesList] lectureName : " + lectureName);
		
		Map<String, Object> map = salesService.getLectureSalesList(current,lectureName);
		log.debug(TeamColor.CE + "[SalesController.lectureSalesList] map : " + map);
		map.forEach((key, value) -> model.addAttribute(key, value));
		
		return "/employee/lectureSalesList";
	}
	
	//월별 매출리스트
	@GetMapping("/monthSalesList")
	public String monthSalesList(@RequestParam(required = false, value = "current") String current,
			@ModelAttribute("check") String check, Model model, @RequestParam(value="payDateM", required=false) String payDateM) {
		log.debug(TeamColor.CE + "[SalesController.monthSalesList] payDateM : " + payDateM);
		
		Map<String, Object> map = salesService.getMonthSalesList(current, payDateM);
		log.debug(TeamColor.CE + "[SalesController.monthSalesList] map : " + map);
		
		map.forEach((key, value) -> model.addAttribute(key, value));

		return "/employee/monthSalesList";
	}
}
