package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.EmployeePaymentMapper;
import com.gd.finalproject.mapper.SalesMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SalesService {
	@Autowired
	SalesMapper salesMapper;
	@Autowired EmployeePaymentMapper employeePaymentMapper;

	//매출리스트 메인
	public Map<String,Object> getSalesList(String current){
		//페이징 토탈
		int total = employeePaymentMapper.getEmployeePaymentTotal(); 
		log.debug(TeamColor.CE + "[SalesService.getSalesList] total : " + total);
		
		// 만들어논 메서드
		PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/salesList", 10);
		log.debug(TeamColor.CE + "[SalesService.getSalesList] pageNation : " + pageNation);
		
		//전체 매출리스트
		List<Map<String,Object>> list = employeePaymentMapper.selectEmployeePaymentList(pageNation.getBeginRow(), pageNation.getRowPerPage());
		log.debug(TeamColor.CE + "[SalesService.getSalesList] list : " + list);
		
		//총매출
		String totalSales = salesMapper.getTotalSales();
		log.debug(TeamColor.CE + "[SalesService.getSalesList] totalSales : " + totalSales);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageNation", pageNation);
		map.put("list", list);
		map.put("totalSales", totalSales);

		return map;
	}
	// 과목별 매출리스트
	public Map<String, Object> getLectureSalesList(String current, String lectureName) {
		int total = salesMapper.getLectureSalesTotal(lectureName);
		log.debug(TeamColor.CE + "[SalesService.getLectureSalesList] total : " + total);

		// 만들어논 메서드
		PageNationDto pageNation = PageNationUtil.getPageNation(current, total,
				"/finalproject/lectureSalesList?lectureName="+lectureName, 10);
		log.debug(TeamColor.CE + "[SalesService.getLectureSalesList] pageNation : " + pageNation);

		List<Map<String,Object>> list = salesMapper.selectLectureSalesList(pageNation.getBeginRow(), pageNation.getRowPerPage(), lectureName);
		List<Map<String,Object>> totalSales = salesMapper.getLectureTotalSales();
		log.debug(TeamColor.CE + "[SalesService.getLectureSalesList] totalSales : " + totalSales);
		
		log.debug(TeamColor.CE + "[SalesService.getLectureSalesList] list : " + list);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageNation", pageNation);
		map.put("list", list);
		map.put("totalSales", totalSales);
					
		return map;
	}
}
