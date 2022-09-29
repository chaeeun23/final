package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SalesMapper {

	//전체 매출리스트 
	List<Map<String,Object>> selectEmployeePaymentList(@Param("beginRow") int beginRow,
			@Param("rowPerPage") int rowPerPage);
	//전체 매출리스트 페이징 Total
	int getEmployeePaymentTotal();
	
	//전체 매출
	String getTotalSales();
		
	
	// 과목별 매출리스트
	List<Map<String,Object>> selectLectureSalesList(@Param("beginRow") int beginRow,
			@Param("rowPerPage") int rowPerPage, String lectureName);
	// 과목별 매출리스트 페이징 Total
	int getLectureSalesTotal(String lectureName);
	
	//과목별 전체매출 
	List<Map<String,Object>> getLectureTotalSales();
	
	
	//월별 매출리스트 
	List<Map<String,Object>> selectMonthSalesList(@Param("beginRow") int beginRow,
			@Param("rowPerPage") int rowPerPage, String payDateM);
	//월별 매출리스트 페이징 Total
	int getMonthSalesListTotal(String payDateM);
	
	//월별 전체매출
	List<Map<String,Object>> getMonthTotalSales();
}
