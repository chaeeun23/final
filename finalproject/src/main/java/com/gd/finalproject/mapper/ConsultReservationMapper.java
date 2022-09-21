package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.ConsultReservation;

@Mapper
public interface ConsultReservationMapper {
	//consultReservationList 상담예약리스트(달력)
	List<ConsultReservation> selectConsultReservationListByMonth(int year, int month);

	//consultReservationOne 상담예약상세보기
	Map<String,Object> selectConsultReservationOne(@Param("consultReservationNo") int consultReservationNo);
}
