package com.gd.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.finalproject.vo.NoticeFile;


@Mapper
public interface NoticeFileMapper {
	int insertNoticeFile(NoticeFile noticeFile);
	
}
