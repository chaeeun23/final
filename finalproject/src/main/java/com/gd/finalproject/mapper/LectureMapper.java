package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.finalproject.vo.Lecture;

@Mapper
public interface LectureMapper {
	// lectureList
	List<Lecture> selectLectureList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// lectureList 페이징 Total
	int getLectureTotal();

	// lectureListOne
	Map<String,Object> selectLectureOne(@Param("lectureNo") String lectureNo);

}
