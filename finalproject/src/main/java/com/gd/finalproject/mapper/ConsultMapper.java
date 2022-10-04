package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.ConsultReservation;

@Mapper
public interface ConsultMapper {

	//상담예약(회원)
	int insertConsultReservation(ConsultReservation consultReservation);

	//상담예약리스트(회원)
	List<ConsultReservation> selectUserConsultReservationList(@Param("userId") String userId);
	
	//상담예약상세(회원)
	Map<String,Object> selectUserConsultReservationOne(@Param("userId") String userId);

	//상담예약수정(회원)
	int updateConsultReservation(ConsultReservation consultReservation);
	
	//상담예약삭제(회원) 
	int deleteConsultReservation(int ConsultReservationNo);
	
	
	
}
