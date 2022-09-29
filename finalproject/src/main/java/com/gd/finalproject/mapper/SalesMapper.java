package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SalesMapper {

	// 과목별 매출리스트
	List<Map<String,Object>> selectLectureSalesList(@Param("beginRow") int beginRow,
			@Param("rowPerPage") int rowPerPage, String lectureName);
	// 과목별 매출리스트 페이징 Total
	int getLectureSalesTotal(String lectureName);
	
	//과목별 매출 
	List<Map<String,Object>> getLectureTotalSales();
	
	//총 매출
	String getTotalSales();
	
}
