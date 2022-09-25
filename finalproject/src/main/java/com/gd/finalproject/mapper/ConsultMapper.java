package com.gd.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.finalproject.vo.ConsultReservation;

@Mapper
public interface ConsultMapper {

	//상담예약(회원)
	int insertConsultReservation(ConsultReservation consultReservation);
}
