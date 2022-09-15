package com.gd.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.mapper.LectureMapper;

@Service
@Transactional
public class LectureService{
	@Autowired LectureMapper lectureMapper;
	
	// 강좌리스트
	public List<Map<String,Object>> getLectureList() {
		List<Map<String,Object>> lectureList = lectureMapper.selectLectureList();
		// debugging
		System.out.println("LectureService.getLectureList.lectureList : " + lectureList);
		return lectureList;
	}	
	
}
