package com.gd.finalproject.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.service.NoticeService;
import com.gd.finalproject.vo.Notice;

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
		log.debug(TeamColor.YW + "NoticeController.model(noticeListMap) : " + model);
		return "/commons/noticeList";
	}
	
	// 공지사항 상세보기
	@GetMapping("/noticeOne")
	public String noticeOne(@RequestParam(value = "noticeNo") int noticeNo, Model model) {
		Map<String,Object> noticeOneMap = noticeService.getNoticeOne(noticeNo);
		log.debug(TeamColor.YW + "NoticeController(noticeOne) : " + noticeOneMap);
		noticeOneMap.forEach((key, value) -> model.addAttribute(key, value));
		log.debug(TeamColor.YW + "NoticeController.model(noticeOne) : " + model);
		return "/commons/noticeOne";
	}
	
	// 공지사항 추가 - Form
	@GetMapping("/addNotice")
	public String addNotice(Model model) {
		return "/commons/addNotice";
	}
	
	// 공지사항 추가 - Action
	@PostMapping("/addNotice")
	public String addNotice(Model model, Notice notice, HttpSession session) {
		String path = session.getServletContext().getRealPath("/noticeFileUpload");
		
		log.debug(TeamColor.YW + "NoticeController.path : " + path);
		
		noticeService.addNotice(notice, path);
		log.debug(TeamColor.YW + "NoticeController.noticeForm : " + notice);
		
		return "redirect:/noticeList";
		
	}
	
	// 첨부파일 다운로드
	@GetMapping("notice/download/file")
	public ResponseEntity<Object> downloadFile(String fileName, HttpServletRequest request) throws UnsupportedEncodingException {
		
		//파일 경로 설정
		String realPath = request.getSession().getServletContext().getRealPath("/noticeFileUpload") +"/"+ fileName;

		//값 확인 디버깅
		log.debug(TeamColor.YW + "값 확인 / realPath: "+realPath);
		
		//리턴값 세팅
		ResponseEntity<Object> returnVal = noticeService.downloadNoticeFile(fileName, realPath);
		
		//값 확인 디버깅
		log.debug(TeamColor.YW + "값 확인 / returnVal: "+returnVal);
		
		//리턴
		return returnVal;
				
	}
	
	// 공지사항 삭제
	@GetMapping("/removeNotice")
	public String removeNotice(@RequestParam(value="noticeNo") int noticeNo, String fileName, HttpServletRequest request) throws UnsupportedEncodingException {
		
		int removeNotice = noticeService.removeNotice(noticeNo, fileName, request);
		log.debug(TeamColor.YW + "noticeController(removeNotice) : " + removeNotice);
		
		
		return "redirect:/noticeList";
	}
	
	// 공지사항 수정 - Form
	@GetMapping("/modifyNotice")
	public String modifyNotice(Model model, int noticeNo, String fileName, HttpServletRequest request) throws UnsupportedEncodingException {
		// 파라미터 확인
		log.debug(TeamColor.YW + "noticeNo : " + noticeNo);
		log.debug(TeamColor.YW + "fileName : " + fileName);
			
		// 강좌 상세페이지에서 값 받아오기
		Map<String,Object> noticeOneMap = noticeService.getNoticeOne(noticeNo);
		log.debug(TeamColor.YW + "NoticeController(noticeOne) : " + noticeOneMap);
		noticeOneMap.forEach((key, value) -> model.addAttribute(key, value));
		log.debug(TeamColor.YW + "NoticeController.model(noticeOne) : " + model);
		return "/commons/modifyNotice";
	}
	
	// 공지사항 수정 - Action
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice, String fileName, HttpServletRequest request) throws UnsupportedEncodingException {
		// 파라미터 확인
		log.debug(TeamColor.YW + "modifyNotice.notice.getNoticeNo() : " + notice.getNoticeNo());
		log.debug(TeamColor.YW + "modifyNotice.fileName : " + fileName);
		
		String path = request.getSession().getServletContext().getRealPath("/noticeFileUpload");
		log.debug(TeamColor.YW + "modifyNotice.path : " + path);
		
		// 공지사항 수정하기
		int updateNotice = noticeService.modifyNotice(notice, path, fileName, request);
		log.debug(TeamColor.YW + "NoticeController.modifyNotice(updateNotice) : " + updateNotice);
		return "redirect:/noticeOne?noticeNo=" + notice.getNoticeNo();/* + "&fileName=" + fileName */
	}
	
}
