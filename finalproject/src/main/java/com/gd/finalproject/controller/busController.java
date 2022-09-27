package com.gd.finalproject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.BusService;
import com.gd.finalproject.vo.Bus;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class busController {
	@Autowired BusService busService;
	
	// 버스 리스트(busList.jsp)
	@GetMapping("/busList")
	public String busList(@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check, Model model) {
		Map<String,Object> busList = busService.getBusList(current);
		
		log.debug(TeamColor.MS + "busController.busList : " + busList);
		busList.forEach((key, value) -> model.addAttribute(key, value));
		
		// busNo 값 확인
		log.debug(TeamColor.MS + "busController.busList(busNo) : " + model);
		
		return "/employee/busList";		
	}
	
	// 버스 추가 (addBus.jsp-Form)
	@GetMapping("/addBus")
	public String addBus() {
		return "/employee/addBus";
	}
	
	// 버스 추가 (addBus.jsp-Action)
	@PostMapping("/addBus")
	public String addBus(Bus bus)  {
		// bus에 값 들어와 있는지 확인
		log.debug(TeamColor.MS + "busController.addBus(bus) : " + bus);
				
		// 버스 추가
		int addBus = busService.addBus(bus);
		log.debug(TeamColor.MS + "busController.addBus(addBus) : " + addBus);
			
		return "redirect:/busList";
	}
	
	// 버스 수정(modifyBus - Form)
	@GetMapping("/modifyBus")
	public String modifyBus(Model model, @RequestParam(value="busNo") int busNo) {
		// 버스번호 값 넘어 왔는지 확인
		log.debug(TeamColor.MS + "BusController.modifyBus(busNo) : " + busNo);
		
		Bus modifyBus = busService.getModifyBus(busNo);
		model.addAttribute("modifyBus",modifyBus);
		log.debug(TeamColor.MS + "BusController.modifyBus(modifyBus) : " + modifyBus);
		
		return "/employee/modifyBus";
	}
	
	// 버스 수정(modifyBus - Action)
	@PostMapping("/modifyBus")
	public String modifyBus(Bus bus) {
		// 값 넘겨받기
		log.debug(TeamColor.MS + "BusController.modifyBus(bus) : " + bus);
		
		// 버스 수정하기
		int updateBus = busService.modifyBus(bus);
		log.debug(TeamColor.MS + "BusController.modifyBus(updateBus) : " + updateBus);
		return "redirect:/busList";
	}
	
	
	// 버스 삭제(removeBus)
	@GetMapping("/removeBus")
	public String removeBus(@RequestParam(value="busNo") int busNo) {
		// busNo에 값 들어와 있는지 확인
		log.debug(TeamColor.MS + "busController.removeBus(busNo) : " + busNo);
					
		int removeBus = busService.removeBus(busNo);
		log.debug(TeamColor.MS + "busController.removeBus(removeBus) : " + removeBus);
		return "redirect:/busList";
	}
	
	
	
}
