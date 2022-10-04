package com.gd.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LockerMapper {
	
	// 사물함 선택했을 경우 사물함 배정
	int insertLocker(int courseNo);
}
