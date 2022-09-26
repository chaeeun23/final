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
import com.gd.finalproject.service.RouteService;
import com.gd.finalproject.vo.Route;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RouteController {
	@Autowired RouteService routeServcie;
	
	// 노선 리스트(routeList)
	@GetMapping("/routeList")		
	public String getRouteList(@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check, Model model) {
	Map<String,Object> routeList = routeServcie.getRouteList(current);
		log.debug(TeamColor.MS + "RouteController.selecteRouteList(routeList) : " + routeList);
		routeList.forEach((key, value) -> model.addAttribute(key, value));
		return "/employee/routeList";		// 경로
	}
	
	// 노선 추가 (addRoute.jsp-Form)
	@GetMapping("/addRoute")
	public String addRoute() {
		return "/employee/addRoute";
	}
	
	// 노선 추가 (addRoute.jsp-Action)
	@PostMapping("/addRoute")
	public String addRoute(Route route)  {
		// bus에 값 들어와 있는지 확인
		log.debug(TeamColor.MS + "RouteController.addRoute(route) : " + route);
				
		// 버스 추가
		int addRoute = routeServcie.addRoute(route);
		log.debug(TeamColor.MS + "RouteController.addRoute(addRoute) : " + addRoute);
			
		return "redirect:/routeList";
	}
	
	// 노선 수정(modifyRoute - Form)
	@GetMapping("/modifyRoute")
	public String modifyRoute(Model model, @RequestParam(value="routeNo") int routeNo) {
		// 노선번호 값 넘어 왔는지 확인
		log.debug(TeamColor.MS + "RouteController.modifyRoute(routeNo) : " + routeNo);
		
		// 노선 수정하기
		Route updateRoute = routeServcie.getModifyRoute(routeNo);
		model.addAttribute("updateRoute", updateRoute);
		log.debug(TeamColor.MS + "RouteController.modifyRoute(updateRoute) : " + updateRoute);
	
		return "/employee/modifyRoute";
	}
	
	// 노선 수정(modifyRoute - Action)
	@PostMapping("/modifyRoute")
	public String modifyRoute(Route route) {
		// route 값 넘겨받기
		log.debug(TeamColor.MS + "RouteController.modifyRoute(route) : " + route);
		
		// 버스 수정하기
		int updateRoute = routeServcie.modifyRoute(route);
		log.debug(TeamColor.MS + "RouteController.modifyRoute(updateRoute) : " + updateRoute);
		return "redirect:/routeList";
	}
	
	// 노선 삭제(removeRoute)
	@GetMapping("/removeRoute")
	public String removeBus(@RequestParam(value="routeNo") int routeNo) {
		// routeNo에 값 들어와 있는지 확인
		log.debug(TeamColor.MS + "RouteController.removeRoute(routeNo) : " + routeNo);
			
		// 노선 추가
		int removeRoute = routeServcie.removeRoute(routeNo);
		log.debug(TeamColor.MS + "RouteController.removeRoute(removeRoute) : " + removeRoute);
		return "redirect:/routeList";
	}
	
	
}
