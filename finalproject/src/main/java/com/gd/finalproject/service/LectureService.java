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

    // 강좌 리스트(lectureList)
    public Map<String, Object> getLectureList(String current) {
        // 페이지네이션 총 갯수
        int total = lectureMapper.getLectureTotal();
        log.debug(TeamColor.MS + "LectureService(total) : " + total);

        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/employeeLectureList", 10);
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

    // 강좌 상세페이지(lectureListOne)
    public Map<String, Object> getLectureOne(String lectureNo) {
        Map<String, Object> lectureOne = lectureMapper.selectLectureOne(lectureNo);
        log.debug(TeamColor.MS + "LectureService.lectureOne : " + lectureOne);
        return lectureOne;
    }
    
    // 강좌 form에서 장소 추출(addLecture.jsp-Form)
    public Map<String, Object> addLecture(Location locationNo) {
    	
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
    public int addLecture(Lecture lecture, List<LectureDay> lectureDay) {
    	
    	log.debug(TeamColor.MS + "List<LectureDay> lectureDay : " + lectureDay);
    	
    	// 강좌 추가 
    	int insertLecture = lectureMapper.insertLecture(lecture);
    	log.debug(TeamColor.MS + "LectureService.addLecture(insertLecture) : " + insertLecture);
    	
    	// 강좌 요일 추가
    	Map<String,Object> insertLectureDay = lectureMapper.insertLectureDay(lectureDay);
    	log.debug(TeamColor.MS + "LectureService.addLecture(insertLectureDay) : " + insertLectureDay);
    	
    	return insertLecture;
    }
    
    
    // 강좌 수정
    public int modifyLecture(Lecture lectureNo) {
    	int updateLecture = lectureMapper.updateLecture(lectureNo);
    	log.debug(TeamColor.MS + "LectureService.updateLecture : " + updateLecture);
		return updateLecture;
    	
    }
    
    // 강좌 요일, 강좌 삭제
    public int removeLecture(String lectureNo) {
    	
    	// 강좌 요일 삭제
    	int deleteDayLecture = lectureMapper.deleteLectureDay(lectureNo);
    	log.debug(TeamColor.MS + "LectureService.deleteDayLecture : " + deleteDayLecture);
    	
    	// 강좌 삭제
    	int deleteLecture = lectureMapper.deleteLecture(lectureNo);
        log.debug(TeamColor.MS + "LectureService.deleteLecture : " + deleteLecture);
    	
    	return deleteLecture;
    }
}
