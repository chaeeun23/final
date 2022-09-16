package com.gd.finalproject.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InstrutorController {
	/*
	 * @Autowired InstrutorService instrutorService;
	 */
	/*
	 * // 강사 리스트
	 * 
	 * @GetMapping("/instrutorList") public String instruList(@RequestParam(required
	 * = false, value = "current") String current,
	 * 
	 * @ModelAttribute("check") String check, Model model) { Map<String, Object> map
	 * = instrutorService.getInstrutorList(current); log.debug(TeamColor.CE +
	 * "Controller(instrutorList) : " + map); map.forEach((key, value) ->
	 * model.addAttribute(key, value)); return "/commons/instrutorList"; // 경로 }
	 */

}
