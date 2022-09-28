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
import com.gd.finalproject.service.RaceService;
import com.gd.finalproject.vo.Race;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RaceController {
	@Autowired RaceService raceService;
	
	// 운행 리스트(raceList)
	@GetMapping("/raceList")
	public String getRaceList(@RequestParam(required = false, value = "current") String current,
			@RequestParam(required = false, value = "keyword", defaultValue = "") String keyword,
            @ModelAttribute("check") String check, Model model) {
		Map<String,Object> raceList = raceService.getRaceList(current, keyword);
		log.debug(TeamColor.MS + "RaceController.getRaceList(raceList) : " + raceList);
		raceList.forEach((key, value) -> model.addAttribute(key, value));
		
		return "/commons/raceList";		// 경로
	}
	
	
	// 운행 추가(addRace - Form)
	@GetMapping("/addRace")
	public String addRace(Model model) {
		
		// 버스 번호, 노선 번호 값 추출
		Map<String,Object> busNoAndRouteNo = raceService.addRace();
		log.debug(TeamColor.MS + "RaceController.addRace(busNoAndRouteNo) : " + busNoAndRouteNo);
		busNoAndRouteNo.forEach((key, value) -> model.addAttribute(key, value));
		
		return "/employee/addRace";
	}
	
	// 운행 추가(addRace - Action)
	@PostMapping("/addRace")
	public String addRace(Race race) {
		// race 값 확인
		log.debug(TeamColor.MS + "RaceController.addRace(race) : " + race);
		
		int addRace = raceService.addRace(race);
		log.debug(TeamColor.MS + "RaceController.addRace(addRace) : " + addRace);
		return "redirect:/raceList";
	}
	
	
	// 운행 삭제(removeRace)
	@GetMapping("/removeRace")
	public String remove(@RequestParam(value="raceNo") int raceNo) {
		// raceNo에 값 들어와 있는지 확인
		log.debug(TeamColor.MS + "RaceController.removeRace(raceNo) : " + raceNo);
					
		// 운행 삭제
		int removeRace = raceService.removeRace(raceNo);
		log.debug(TeamColor.MS + "RaceController.removeRace(removeRace) : " + removeRace);
		
		return "redirect:/raceList";
		
	}
	
}
