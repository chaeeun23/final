package com.gd.finalproject.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.ConsultReservation;

@Mapper
public interface ConsultMapper {

	//상담예약(회원)
	int insertConsultReservation(ConsultReservation consultReservation);

	//상담예약상세(회원)
	Map<String,Object> selectUserConsultReservationOne(@Param("userId") String userId);
}
