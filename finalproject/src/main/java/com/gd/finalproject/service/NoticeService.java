package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.NoticeMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.Notice;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {
	@Autowired NoticeMapper noticeMapper;

	// 공지사항 리스트
	public Map<String,Object>getNoticeList(String currentPage) {
		 // 총 갯수
       int total = noticeMapper.getNoticeTotal();
       log.debug(TeamColor.YW + "NoticeService(total) : " + total);
       
       // 만들어논 메서드
       PageNationDto pageNation = PageNationUtil.getPageNation(currentPage, total, "/commons/noticeList", 10);
       log.debug(TeamColor.YW + "NoticeService(pageNation) : " + pageNation);
       
       // NoticeList 가져오기
       List<Notice> noticeList = noticeMapper.getNoticeList(pageNation.getBeginRow(), pageNation.getRowPerPage());
       log.debug(TeamColor.YW + "noticeService(noticeList) : " + noticeList);
       
       // 객체 생성후 넣기
       Map<String, Object> map = new HashMap<>();
       map.put("pageNation", pageNation);
       map.put("noticeList", noticeList);
       
       return map;
	}
}
