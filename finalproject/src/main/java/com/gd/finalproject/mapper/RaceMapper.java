package com.gd.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Bus;
import com.gd.finalproject.vo.Race;
import com.gd.finalproject.vo.Route;

@Mapper
public interface RaceMapper {
	
	// 운행 리스트(raceList)
	List<Race> selectRaceList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 운행 리스트 (raceList) 페이징 - Total
	int getRaceTotal();

	// 버스 번호(addRace(busNo) - Form)
	List<Bus> selectBusNo();
	
	// 노선 번호(addRace(routeNo) - Form)
	List<Route> selectRouteNo();
	
	// 운행 추가(addRace)
	int insertRace(Race race);
	
	// 운행 수정 값 불러오기(updateRace)	- Form
	Route selectUpdateBusForm(int raceNo);
	
	// 운행 수정(updateRace) - Action
	int updateRace(Race race);

	// 운행 삭제(deleteRace)
	int deleteRace(int raceNo);
	
	
	
}
