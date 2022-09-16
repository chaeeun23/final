package com.gd.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.LectureMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService{
	@Autowired LectureMapper lectureMapper;
	
	// 강좌리스트
	public List<Map<String,Object>> getLectureList() {
		List<Map<String,Object>> lectureList = lectureMapper.selectLectureList();
		log.debug(TeamColor.MS + "LectureService.lectureList : " + lectureList);
		return lectureList;
	}	
	
	// 강좌 상세페이지
	public List<Map<String,Object>> getLectureOne() {
		List<Map<String,Object>> lectureOne = lectureMapper.selectLectureList();
		log.debug(TeamColor.MS + "LectureService.lectureOne : " + lectureOne);
		return lectureOne;
	}	
	
	
	
}
