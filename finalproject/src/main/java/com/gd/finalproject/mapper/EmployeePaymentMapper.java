package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface EmployeePaymentMapper {

	//결제리스트(직원)
	List<Map<String, Object>> selectEmployeePaymentList(@Param("beginRow") int beginRow,
			@Param("rowPerPage") int rowPerPage);
	//결제리스트 페이징 Total
	int getEmployeePaymentTotal();
}
