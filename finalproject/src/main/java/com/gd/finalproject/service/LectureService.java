package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.LectureMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.Lecture;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
	@Autowired LectureMapper lectureMapper;

	// 강좌 리스트
	public Map<String, Object> getLectureList(String current) {
		// 페이지네이션 총 갯수
		int total = lectureMapper.getLectureTotal();
		log.debug(TeamColor.MS + "LectureService(total) : " + total);

		// 만들어논 메서드
		PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/employee/lectureList", 10);
		log.debug(TeamColor.MS + "LectureService(pageNation) : " + pageNation);

		// lectureList 가져오기
		List<Lecture> lectureList = lectureMapper.selectLectureList(pageNation.getBeginRow(),
				pageNation.getRowPerPage());
		log.debug(TeamColor.MS + "LectureService(lectureList) : " + lectureList);

		// 객체 생성후 넣기
		Map<String, Object> map = new HashMap<>();
		map.put("pageNation", pageNation);
		map.put("lectureList", lectureList);

		return map;
	}

	// 강좌 상세페이지
	public List<Lecture> getLectureOne(String lectureNo) {
		  List<Lecture> lectureOne = lectureMapper.selectLectureOne(lectureNo);
		  log.debug(TeamColor.MS + "LectureService.lectureOne: " + lectureOne); 
		  return lectureOne; 
	  }

}
