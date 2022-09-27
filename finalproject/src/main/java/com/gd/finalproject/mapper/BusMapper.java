package com.gd.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Bus;

@Mapper
public interface BusMapper {
	
	// 버스 리스트(busList)
	List<Bus> selectBusList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 버스 리스트(busList) 페이징-Total
	int getBusTotal();
	
	// 버스 추가(insertBus)
	int insertBus(Bus bus);
	
	// 버스 수정 폼에 값 불러오기(updateBus)
	Bus selectUpdateBusForm(int busNo);
	
	// 버스 수정(updateBus)
	int updateBus(Bus bus);
	
	// 운행 삭제(deleteRace)
	int deleteRace(int raceNo);
	
	// 버스 삭제(deleteBus)
	int deleteBus(int busNo);
	
	
}
