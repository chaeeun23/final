package com.gd.finalproject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
@Autowired NoticeService noticeService;
	
	// 공지사항 리스트
	@GetMapping("/noticeList")		
	public String noticeList(@RequestParam(required = false, value = "current") String current,
            @ModelAttribute("check") String check, Model model) {
		Map<String,Object> noticeListMap = noticeService.getNoticeList(current);
		log.debug(TeamColor.YW + "NoticeController(noticeListMap) : " + noticeListMap);
		noticeListMap.forEach((key, value) -> model.addAttribute(key, value));
		log.debug(TeamColor.YW + "NoticeController.model(noticeListMap) : " + noticeListMap);
		return "/commons/noticeList";
	}
	
	// 공지사항 상세보기
	@GetMapping("/noticeOne")
	public String noticeOne(@RequestParam(value = "noticeNo") int noticeNo, Model model) {
		Map<String,Object> noticeOneMap = noticeService.getNoticeOne(noticeNo);
		log.debug(TeamColor.YW + "NoticeController(noticeOne) : " + noticeOneMap);
		noticeOneMap.forEach((key, value) -> model.addAttribute(key, value));
		log.debug(TeamColor.YW + "NoticeController.model(noticeOne) : " + noticeOneMap);
		return "/commons/noticeOne";
	}
}
