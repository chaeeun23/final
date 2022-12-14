package com.gd.finalproject.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.LectureMapper;
import com.gd.finalproject.mapper.ReviewMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.Instructor;
import com.gd.finalproject.vo.Lecture;
import com.gd.finalproject.vo.LectureDay;
import com.gd.finalproject.vo.Location;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
    @Autowired LectureMapper lectureMapper;
    @Autowired ReviewMapper reviewMapper;

    // 강좌 리스트(lectureList)
    public Map<String, Object> getLectureList(String current, String type) {
        // 페이지네이션 총 갯수
        int total = lectureMapper.getLectureTotal(type);
        log.debug(TeamColor.MS + "LectureService(total) : " + total);

        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/lectureList", 10);
        log.debug(TeamColor.MS + "LectureService(pageNation) : " + pageNation);

        // lectureList 가져오기
        List<Lecture> lectureList = lectureMapper.selectLectureList(pageNation.getBeginRow(),
                pageNation.getRowPerPage(),type);
        log.debug(TeamColor.MS + "LectureService(lectureList) : " + lectureList);

        // 객체 생성후 넣기
        Map<String, Object> map = new HashMap<>();
        map.put("pageNation", pageNation);
        map.put("lectureList", lectureList);

        return map;
    }

    // 강좌 상세페이지(lectureListOne)
    public Map<String, Object> getLectureOne(String lectureNo) {
        Map<String, Object> lectureOne = lectureMapper.selectLectureOne(lectureNo);
        log.debug(TeamColor.MS + "LectureService.lectureOne : " + lectureOne);
        return lectureOne;
    }
    
    
    // 강좌 Form에서 장소, 강사 추출(addLecture.jsp-Form)
    public Map<String, Object> addLecture() {
    	
	    // 장소 
		List<Location> location = lectureMapper.selectLocation();
		log.debug(TeamColor.MS + "LectureService.addLectureForm(location) : " + location);
		
		// 강사
		List<Instructor> instructor = lectureMapper.selectInstructor();
		log.debug(TeamColor.MS + "LectureService.addLectureForm(instructor) : " + instructor);
		
		
		// 객체 생성 후 객체에 값 넣기
		Map<String, Object> map = new HashMap<>();
		map.put("location", location);
		map.put("instructor", instructor);
		
		return map; 
    } 
	
    // 강좌 추가 (addLecture.jsp-Action)
    public int addLecture(Lecture lecture) {
    	// lecture 값들 넣어졌는지 확인
    	log.debug(TeamColor.MS + "LectureService.addLecture(lecture) : " + lecture);
    	

    	// 강좌 추가 
    	int insertLecture = lectureMapper.insertLecture(lecture);
    	log.debug(TeamColor.MS + "LectureService.addLecture(insertLecture) : " + insertLecture);
    	
    	// 강좌 요일 배열로 하나씩 LectureDay 넣기
    	for(String s : lecture.getLectureDay()) {
    		LectureDay lectureDay = new LectureDay();
    		lectureDay.setLectureDay(s);
    		lectureDay.setLectureNo(lecture.getLectureNo());
    		
    		int insertLectureDay = lectureMapper.insertLectureDay(lectureDay);
    		log.debug(TeamColor.MS + "LectureService.addLecture(insertLectureDay) : " + insertLectureDay);
    	}

    	return insertLecture;
    }
    
    
    // 강좌 수정 (modifyLecture) - 강좌 요일 삭제 후 추가, 강좌 수정
    public int modifyLecture(Lecture lecture, String lectureNo) {
    	
    	// 강좌 수정
    	int updateLecture = lectureMapper.updateLecture(lecture);
    	log.debug(TeamColor.MS + "LectureService.modifyLecture(updateLecture) : " + updateLecture);
    	
    	// 강좌 요일 삭제
    	int deleteLectureDay = lectureMapper.deleteLectureDay(lectureNo);
    	log.debug(TeamColor.MS + "LectureService.modifyLecture(deleteLectureDay) : " + deleteLectureDay);
    	
    	// 강좌 요일 배열로 하나씩 LectureDay 넣기
    	for(String s : lecture.getLectureDay()) {
    		LectureDay lectureDay = new LectureDay();
    		lectureDay.setLectureDay(s);
    		lectureDay.setLectureNo(lecture.getLectureNo());
    		
    		// 강좌 요일 추가
    		int insertLectureDay = lectureMapper.insertLectureDay(lectureDay);
    		log.debug(TeamColor.MS + "LectureService.modifyLecture(insertLectureDay) : " + insertLectureDay);
    	}
		return updateLecture;
    }
    
    // 강좌 삭제(deleteLecture) - lecture_deleteYn => 'Y'로 변경
    public int removeLecture(String lectureNo) {
    	
    	// DeleteYn => Y로 변경
		int updateLectureDeleteYn = lectureMapper.updateLectureDeleteYn(lectureNo);
       	log.debug(TeamColor.MS + "LectureService.removeLecture(updateLectureDeleteYn) : " + updateLectureDeleteYn);
    	
    	return updateLectureDeleteYn;
    }
    
    
    
}
