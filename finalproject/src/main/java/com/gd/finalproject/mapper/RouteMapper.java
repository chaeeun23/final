package com.gd.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Route;

@Mapper
public interface RouteMapper {
	
	// 노선 리스트 (routeList)
	List<Route> selectRouteList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 노선 리스트 (routeList) 페이징-Total
	int getRouteTotal();

	// 노선 추가(insertRoute)
	int insertRoute(Route route);
	
	// 노선 수정 값 불러오기(updateRoute)	- Form
	Route selectUpdateBusForm(int routeNo);
	
	// 노선 수정(updateRoute) - Action
	int updateRoute(Route route);
	
	// 노선 삭제(deleteRoute)
	int deleteRoute(int routeNo);
	
	
}
