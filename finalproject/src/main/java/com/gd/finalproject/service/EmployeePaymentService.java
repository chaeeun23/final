package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.EmployeePaymentMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class EmployeePaymentService {
	@Autowired EmployeePaymentMapper employeePaymentMapper;
	
	// 결제리스트(직원)
	public Map<String,Object> getEmployeePaymentList(String current){
		int total = employeePaymentMapper.getEmployeePaymentTotal();
		log.debug(TeamColor.CE + "[EmployeePaymentService.getEmployeePaymentList] total : " + total);
		
		// 만들어논 메서드
		PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/employeePaymentList", 10);
		log.debug(TeamColor.CE + "[EmployeePaymentService.getEmployeePaymentList] pageNation : " + pageNation);
		
		List<Map<String,Object>> list = employeePaymentMapper.selectEmployeePaymentList(pageNation.getBeginRow(), pageNation.getRowPerPage());
		log.debug(TeamColor.CE + "[EmployeePaymentService.getEmployeePaymentList] list : " + list);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageNation", pageNation);
		map.put("list", list);

		return map;
		
	}
}
