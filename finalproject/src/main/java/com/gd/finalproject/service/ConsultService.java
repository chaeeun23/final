package com.gd.finalproject.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.ConsultMapper;
import com.gd.finalproject.vo.ConsultReservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class ConsultService {
	@Autowired ConsultMapper consultMapper;
	
	//상담예약(회원) 
	public int addConsultReservation(ConsultReservation consultReservation){
		log.debug(TeamColor.CE + "[ConsultService.addConsultReservation] consultReservation : " + consultReservation);
		
		int insertConsultReservation = consultMapper.insertConsultReservation(consultReservation);
		
		return insertConsultReservation;
	}
	
	//상담예약상세(회원)
	public Map<String, Object> getUserConsultReservationOne(String userId){
		Map<String,Object> map = consultMapper.selectUserConsultReservationOne(userId);
		log.debug(TeamColor.CE + "[ConsultService.getUserConsultReservationOne] map : " + map);
		return map;
	}
	
	//상담예약수정(회원)
	public int modifyConsultReservation(ConsultReservation consultReservation) {
		log.debug(TeamColor.CE + "[ConsultService.modifyConsultReservation] consultReservation : " + consultReservation);
		
		int updateConsultReservation = consultMapper.updateConsultReservation(consultReservation);
		
		return updateConsultReservation;
	}
	
	//상담예약삭제(회원)
	public int removeConsultReservation(int consultReservationNo) {
		log.debug(TeamColor.CE + "[ConsultService.removeConsultReservation] consultReservationNo : " + consultReservationNo);
		
		int deleteConsultReservation = consultMapper.deleteConsultReservation(consultReservationNo);
		
		return deleteConsultReservation;
	}
	
}
