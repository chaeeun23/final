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

import lombok.extern.slf4j.Slf4j;

@Slf4j

@Controller
public class EmployeePaymentController {
	@Autowired EmployeePaymentService employeePaymentService;

	// 결제리스트(직원)
	@GetMapping("/employeePaymentList")
	public String employeePaymentList(@RequestParam(required = false, value = "current") String current,
			@ModelAttribute("check") String check, Model model) {
		Map<String, Object> map = employeePaymentService.getEmployeePaymentList(current);
		log.debug(TeamColor.CE + "[EmployeePaymentController.employeePaymentList] map : " + map);
		map.forEach((key, value) -> model.addAttribute(key, value));

		return "/employee/employeePaymentList";
	}
}
