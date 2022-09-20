package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.InstructorMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class InstructorService {
	@Autowired
	InstructorMapper instructorMapper;

	// 강사리스트
	public Map<String, Object> getInstructorList(String current) { // 총 갯수
		int total = instructorMapper.getInstructorTotal();
		log.debug(TeamColor.CE + "InstructorService(total) : " + total);

		// 만들어논 메서드
		PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/commons/instructorList", 10);
		log.debug(TeamColor.CE + "InstructorService(pageNation) : " + pageNation);

		// instructorList 가져오기
		List<Map<String, Object>> instructorList = instructorMapper.selectInstructorList(pageNation.getBeginRow(), pageNation.getRowPerPage());
		log.debug(TeamColor.CE + "InstructorService(lectureList) : " + instructorList);

		// 객체 생성후 넣기
		Map<String, Object> map = new HashMap<>();
		map.put("pageNation", pageNation);
		map.put("instructorList", instructorList);

		return map;
	}
	
	// 강사상세페이지
	public Map<String,Object> getInstructorOne(String memberId){
		Map<String,Object> map = instructorMapper.selectInstructorOne(memberId);
		log.debug(TeamColor.CE + "InstructorService.instructorOne : " + map);
		return map;
	}
	
}
