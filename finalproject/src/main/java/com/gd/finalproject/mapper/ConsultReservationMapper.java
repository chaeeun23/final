package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Consult;
import com.gd.finalproject.vo.ConsultReservation;

@Mapper
public interface ConsultReservationMapper {
	//consultReservationList 상담예약리스트(달력)
	List<ConsultReservation> selectConsultReservationListByMonth(int year, int month);

	//consultReservationOne 상담예약상세보기
	Map<String,Object> selectConsultReservationOne(@Param("consultReservationNo") int consultReservationNo);

	//addConsult 상담예약한 회원의 상담내역 추가
	//직원이름
	List<Map<String,Object>> selectEmployee();
	
	int insertConsult(Consult consult);
	
	//modifyConsult 상담예약하고 상담한 내역 수정 
	int updateConsult(Consult consult);
	
}
