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
import com.gd.finalproject.vo.PageNationDto;
import com.gd.finalproject.vo.Route;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RouteService {
	@Autowired RouteMapper routeMapper;
	
	
	// 노선 리스트(routeList)
	public Map<String, Object> getRouteList(String current){
		// 페이지네이션 총 갯수
        int total = routeMapper.getRouteTotal();
        log.debug(TeamColor.MS + "RouteService(total) : " + total);

        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/routeList", 10);
        log.debug(TeamColor.MS + "RouteService(pageNation) : " + pageNation);

        // RouteList 가져오기
        List<Route> routeList = routeMapper.selectRouteList(pageNation.getBeginRow(),
                pageNation.getRowPerPage());
        log.debug(TeamColor.MS + "RouteService(routeList) : " + routeList);

        // 객체 생성후 넣기
        Map<String, Object> map = new HashMap<>();
        map.put("pageNation", pageNation);
        map.put("routeList", routeList);

        return map;
	}
	
	// 노선 추가 (addRoute.jsp-Action)
	public int addRoute(Route route) {
		// route 값 넣어졌는지 확인
    	log.debug(TeamColor.MS + "RouteService.addRoute(route) : " + route);
    	
    	// 노선 추가
    	int inserteRoute = routeMapper.insertRoute(route);
    	log.debug(TeamColor.MS + "RouteService.addRoute(inserteRoute) : " + inserteRoute);
    	
		return inserteRoute;
	}
	
	// 노선 수정 - 값 불러오기 (modifyRoute - Form)
	public Route getModifyRoute(int routeNo) {
		// 노선 값 불러오기
		Route getRoute = routeMapper.selectUpdateBusForm(routeNo);
		log.debug(TeamColor.MS + "RouteService.modifyRoute(getRoute) : " + getRoute);
    	 
    	return getRoute;
	}
	
	
	// 노선 수정 (modifyRoute - Action) 
	public int modifyRoute(Route route) {
		// route 값 확인
    	log.debug(TeamColor.MS + "RouteService.modifyRoute(route) : " + route);
    	
    	// 노선 수정
    	int updateRoute = routeMapper.updateRoute(route);
    	log.debug(TeamColor.MS + "RouteService.modifyRoute(updateRoute) : " + updateRoute);
    
		return updateRoute;
	}
	
	// 노선 삭제 (removeRoute) - 노선, 버스, 운행 삭제(외래키 연결)
	public int removeRoute(int routeNo) {
		// routeNo 값 확인
    	log.debug(TeamColor.MS + "RouteService.removeRoute(routeNo) : " + routeNo);
    	
    	// 노선 삭제
    	int removeRoute = routeMapper.deleteRoute(routeNo);
    	log.debug(TeamColor.MS + "RouteService.removeRoute(removeRoute) : " + removeRoute);
    	
		return removeRoute;
	}
	
	
	
	
	
	
	
}
