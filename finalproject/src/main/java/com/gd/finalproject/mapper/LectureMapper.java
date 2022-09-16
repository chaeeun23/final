package com.gd.finalproject.mapper;

import java.util.List;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Lecture;

@Mapper
public interface LectureMapper {
	List<Lecture> getLectureList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);

	int getLectureTotal();

	// 강좌상세페이지
	List<Map<String, Object>> selectLectureOne();

}
