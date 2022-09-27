package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.BusMapper;
import com.gd.finalproject.mapper.RaceMapper;
import com.gd.finalproject.mapper.RouteMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.Bus;
import com.gd.finalproject.vo.PageNationDto;
import com.gd.finalproject.vo.Race;
import com.gd.finalproject.vo.Route;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RaceService {
	@Autowired RouteMapper routeMapper;
	@Autowired RaceMapper raceMapper;
	@Autowired BusMapper busMapper;
	
	// 운행 리스트(raceList.jsp)
	public Map<String, Object> getRaceList(String current){
		// 페이지네이션 총 갯수
        int total = raceMapper.getRaceTotal();
        log.debug(TeamColor.MS + "RaceService(total) : " + total);

        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/raceList", 10);
        log.debug(TeamColor.MS + "RaceService(pageNation) : " + pageNation);

        // RouteList 가져오기
        List<Race> raceList = raceMapper.selectRaceList(pageNation.getBeginRow(),
                pageNation.getRowPerPage());
        log.debug(TeamColor.MS + "RaceService(raceList) : " + raceList);

        // 객체 생성후 넣기
        Map<String, Object> map = new HashMap<>();
        map.put("pageNation", pageNation);
        map.put("raceList", raceList);

        return map;
	}
	
	// 운행 추가 (addRace.jsp - Form)
	public Map<String, Object> addRace() {
		
		// 버스 번호 
		List<Bus> busNoList = raceMapper.selectBusNo();
		log.debug(TeamColor.MS + "RaceService.addRace(busNoList) : " + busNoList);
		
		// 노선 번호
		List<Route> routeNoList = raceMapper.selectRouteNo();
		log.debug(TeamColor.MS + "RaceService.addRace(routeNoList) : " + routeNoList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("busNoList", busNoList);
		map.put("routeNoList", routeNoList);
		log.debug(TeamColor.MS + "RaceService.addRace(map) : " + map);
		
		return map;
		
	}
	
	
	// 운행 추가(addRace.jsp - Action)
	public int addRace(Race race) {
		// race 값 확인
		log.debug(TeamColor.MS + "RaceService.addRace(race) : " + race);
		
		// 운행 추가
		int addRace = raceMapper.insertRace(race);
		log.debug(TeamColor.MS + "RaceService.addRace(addRace) : " + addRace);
		return addRace;
	}
	
	
	// 운행 삭제(removeRace.jsp)
	public int removeRace(int raceNo) {

		// raceNo 값 확인
		log.debug(TeamColor.MS + "RaceService.removeRace(raceNo) : " + raceNo);
	
     	// 운행 삭제
    	int removeRace = raceMapper.deleteRace(raceNo);
		log.debug(TeamColor.MS + "RaceService.removeRace(removeRace) : " + removeRace);
		
		return removeRace;
	}
	
}
