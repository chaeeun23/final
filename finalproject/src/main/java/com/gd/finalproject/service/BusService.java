package com.gd.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.BusMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.Bus;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BusService {
	@Autowired BusMapper busMapper;
	
	// 버스 리스트(busList)
	public Map<String, Object> getBusList(String current){
        // 페이지네이션 총 갯수
        int total = busMapper.getBusTotal();
        log.debug(TeamColor.MS + "BusService(total) : " + total);

        // 만들어논 메서드
        PageNationDto pageNation = PageNationUtil.getPageNation(current, total, "/finalproject/busList", 10);
        log.debug(TeamColor.MS + "BusService(pageNation) : " + pageNation);

        // busList 가져오기
        List<Bus> busList = busMapper.selectBusList(pageNation.getBeginRow(),
                pageNation.getRowPerPage());
        log.debug(TeamColor.MS + "BusService(busList) : " + busList);

        // 객체 생성후 넣기
        Map<String, Object> map = new HashMap<>();
        map.put("pageNation", pageNation);
        map.put("busList", busList);

        return map;
	}
	
    // 버스 추가 (addBus - Action)
    public int addBus(Bus bus) {
    	// bus 값들 넣어졌는지 확인
    	log.debug(TeamColor.MS + "BusService.addBus(bus) : " + bus);
    	
    	// 버스 추가 
    	int insertBus = busMapper.insertBus(bus);
    	log.debug(TeamColor.MS + "BusService.addBus(insertBus) : " + insertBus);
    
    	return insertBus;
    }
	
    
    // 버스 수정하기 (modifyBus - Action )
    public int modifyBus(Bus bus) {
    	// bus 값들 넣어졌는지 확인
    	log.debug(TeamColor.MS + "BusService.modifyBus(bus) : " + bus);
    	
    	// 버스 추가 
    	int modifyBus = busMapper.updateBus(bus);
    	log.debug(TeamColor.MS + "BusService.modifyBus(bus) : " + modifyBus);
    
		return modifyBus;
    }
    
    
    // 버스 삭제 (removeBus)
    public int removeBus(int busNo) {
    	
	    int deleteBus = busMapper.deleteBus(busNo);
    	log.debug(TeamColor.MS + "BusService.addBus(deleteBus) : " + deleteBus);
    	
    	return deleteBus;
    }
	
    
    
	
}
