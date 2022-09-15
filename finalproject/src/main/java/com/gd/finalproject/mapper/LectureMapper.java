package com.gd.finalproject.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureMapper {
	
	// 강좌리스트
	List<Map<String,Object>> selectLectureList();
}
