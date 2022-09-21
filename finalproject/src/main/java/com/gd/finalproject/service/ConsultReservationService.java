package com.gd.finalproject.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.ConsultReservationMapper;
import com.gd.finalproject.vo.ConsultReservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Service
@Transactional
public class ConsultReservationService {
	@Autowired ConsultReservationMapper consultReservationMapper;
	
	//consultReservationList 상담예약리스트(달력)
	public Map<String, Object> getConsultReservationListByMonth(int year, int month){
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList.param] year : " + year);
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList.param] month : " + month);
		
		Calendar now = Calendar.getInstance(); // ex) 2022.07.01
		
		if(year == -1) { // null 값으로 기본값인 -1이 들어왔을 때, 현재 연도
			year = now.get(Calendar.YEAR);
		}
		if(month == -1) { // null 값으로 기본값인 -1이 들어왔을 때, 현재 월
			month = now.get(Calendar.MONTH)+1;
		}
		if(month == 0) { // 0이 넘어올 시, 작년(year-1) 12월
			month = 12;
			year = year - 1;
		}
		if(month == 13) { // 13이 넘어올 시, 올해(year+1) 1월
			month = 1;
			year = year + 1;
		}
		
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList] year : " + year);
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList] month : " + month);
		
		// firstDay : 오늘 날짜를 먼저 구하여 날짜만 1일로 변경
		Calendar firstDay = Calendar.getInstance(); // ex) 2022.04.19
		firstDay.set(Calendar.YEAR, year);
		firstDay.set(Calendar.MONTH, month - 1); // 자바 달력 API는 1월을 0으로, 2월을 1로, ... 12월을 11로 설정되어있다.
		firstDay.set(Calendar.DATE, 1); // ex) 2022.04.01
		int dayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		// dayOfWeek는 일 1, 월 2, ..., 토 7
		// startBlank는 일 0, 월 1, ..., 토 6
		
		// 1) startBlank : 달력 시작 시 필요한 공백 개수 (td 공백 개수)
		int startBlank = dayOfWeek - 1; // 일 0, 월 1, ..., 토 6 -> 1일의 요일을 이용하여 구한다
		
		// 2) endDay :  마지막 날짜
		int endDay = firstDay.getActualMaximum(Calendar.DATE);
		
		// 3) endBlank / startBlank와 endDay를 합의 결과에 endBlank를 더해서 7의 배수가 되도록
		int endBlank = 0;
		if ((startBlank + endDay) % 7 != 0) {
			// 7에서 startBlank + endDay의 7로 나눈 나머지 값을 빼면
			endBlank = 7 - ((startBlank + endDay) % 7);
		} 
		
		// 4) totalTd : 전체 td 개수
		int totalTd = startBlank + endDay + endBlank;
		
		// 5) consultReservationList 테이블 리스트
		List<ConsultReservation> consultReservationListByMonth = consultReservationMapper.selectConsultReservationListByMonth(year,month);
		
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList] startBlank : " + startBlank);
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList] endDay : " + endDay);
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList] endBlank : " + endBlank);
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList] totalTd : " + totalTd);
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationList] consultReservationListByMonth : " + consultReservationListByMonth);
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("consultReservationListByMonth", consultReservationListByMonth);
		returnMap.put("startBlank", startBlank);
		returnMap.put("endDay", endDay);
		returnMap.put("endBlank", endBlank);
		returnMap.put("totalTd", totalTd);
		returnMap.put("year", year);
		returnMap.put("month", month);
				
		return returnMap;
	}
	
	//consultReservationOne 상담예약상세보기 
	public Map<String,Object> getConsultReservationOne(int consultReservationNo){
		Map<String,Object> map = consultReservationMapper.selectConsultReservationOne(consultReservationNo);
		log.debug(TeamColor.CE + "[ConsultReservationService.getConsultReservationOne] map : " + map);
		return map;
	}
	
	
}
