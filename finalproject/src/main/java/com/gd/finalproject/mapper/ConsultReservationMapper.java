package com.gd.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.finalproject.vo.ConsultReservation;

@Mapper
public interface ConsultReservationMapper {
	//consultReservationList 상담예약리스트(달력)
	List<ConsultReservation> selectConsultReservationListByMonth(int year, int month);
}
