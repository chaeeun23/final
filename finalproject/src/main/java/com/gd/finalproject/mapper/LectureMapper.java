package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Instructor;
import com.gd.finalproject.vo.Lecture;
import com.gd.finalproject.vo.LectureDay;
import com.gd.finalproject.vo.Location;

@Mapper
public interface LectureMapper {
	// 강좌 리스트(lectureList)
	List<Lecture> selectLectureList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 강좌 리스트(lectureList) 페이징-Total
	int getLectureTotal();

	// 강좌 상세페이지(lectureListOne), 강좌 수정(updateLecture) - Form
	Map<String,Object> selectLectureOne(@Param("lectureNo") String lectureNo);
	
	// 강좌 추가(addLecture - lecture)
	int insertLecture(Lecture lecture);
	
	// 강좌 요일 추가(addLectureDay - lectureDay)
	int insertLectureDay(LectureDay lectureDay);
	
	// 장소 (addLecture - location)
	List<Location> selectLocation();
	
	// 강사 (addLecture - instructor)
	List<Instructor> selectInstructor();
	
	// 강좌 수정(updateLecture) - Action
	int updateLecture(Lecture lecture);
	
	// 강좌 요일 삭제(deleteLecture)
	int deleteLectureDay(String lectureNo);
	
	// 강좌 삭제(deleteLecture)
	int deleteLecture(@Param("lectureNo") String lectureNo);
	
	
}
