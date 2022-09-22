package com.gd.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.NoticeFile;


@Mapper
public interface NoticeFileMapper {
	// 공지사항파일 추가
	int insertNoticeFile(NoticeFile noticeFile);
	
	// 공지사항파일 수정
	int updateNoticeFile(@Param("noticeNo") int noticeNo);
	
	// 공지사항파일 삭제
	int deleteNoticeFile(@Param("noticeNo") int noticeNo);
	
}
