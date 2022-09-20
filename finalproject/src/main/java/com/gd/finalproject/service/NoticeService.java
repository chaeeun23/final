package com.gd.finalproject.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.finalproject.commons.TeamColor;
import com.gd.finalproject.mapper.NoticeFileMapper;
import com.gd.finalproject.mapper.NoticeMapper;
import com.gd.finalproject.util.PageNationUtil;
import com.gd.finalproject.vo.Notice;
import com.gd.finalproject.vo.NoticeFile;
import com.gd.finalproject.vo.PageNationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {
	@Autowired NoticeMapper noticeMapper;
	@Autowired NoticeFileMapper noticeFileMapper;

	// 공지사항 리스트
	public Map<String, Object> getNoticeList(String currentPage) {
		// 총 갯수
		int total = noticeMapper.getNoticeTotal();
		log.debug(TeamColor.YW + "NoticeService(total) : " + total);

		// 만들어논 메서드
		PageNationDto pageNation = PageNationUtil.getPageNation(currentPage, total, "/finalproject/noticeList", 10);
		log.debug(TeamColor.YW + "NoticeService(pageNation) : " + pageNation);

		// NoticeList 가져오기
		List<Notice> noticeList = noticeMapper.getNoticeList(pageNation.getBeginRow(), pageNation.getRowPerPage());
		log.debug(TeamColor.YW + "noticeService(noticeList) : " + noticeList);

		// 객체 생성후 넣기
		Map<String, Object> noticeListMap = new HashMap<>();
		noticeListMap.put("pageNation", pageNation);
		noticeListMap.put("noticeList", noticeList);

		return noticeListMap;
	}

	// 공지사항 상세보기
	public Map<String, Object> getNoticeOne(int noticeNo) {

		// NoticeOne 가져오기
		Map<String, Object> noticeOne = noticeMapper.selectNoticeOne(noticeNo);
		log.debug(TeamColor.YW + "noticeService(noticeOne) : " + noticeOne);

		// 객체 생성후 넣기
		Map<String, Object> noticeOneMap = new HashMap<>();
		noticeOneMap.put("noticeOne", noticeOne);

		return noticeOneMap;
	}
	
	// 공지사항 추가하기
	public void addNotice(Notice notice, String path) {
		
		log.debug(TeamColor.YW + notice.getNoticeNo());
		int row = noticeMapper.insertNotice(notice);
		log.debug(TeamColor.YW + "notice : " + notice);

		// noticeFile insert
		if(row==1 && notice.getMultiList() != null) {
			for(MultipartFile mf : notice.getMultiList()) {
				NoticeFile noticefile = new NoticeFile();
				noticefile.setNoticeNo(notice.getNoticeNo());
				log.debug(TeamColor.YW + "noticefile.noticefile.getNoticeNo() : " +noticefile.getNoticeNo());
				// 중복되지 않는 랜덤이름 생성 UUID API사용
				String filename = UUID.randomUUID().toString().replace("-", "");
				noticefile.setFileName(filename);
				log.debug(TeamColor.YW + "filename : " + filename);
				noticefile.setOriginalFileName(mf.getOriginalFilename());
				noticefile.setFileType(mf.getContentType());
				noticefile.setFileSize(mf.getSize());
				noticeFileMapper.insertNoticeFile(noticefile);
				
				// text.txt
				String ext = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));	// 파일 확장자 구하기
				log.debug(TeamColor.YW + "mf.getOriginalFilename() : " + mf.getOriginalFilename());
				log.debug(TeamColor.YW + "파일 확장자 : " + ext);

				try {
					mf.transferTo(new File(path + File.separator + filename+ext));	// c:/upload/filename.ext 새로운 빈 파일 안에 MultipartFile안에 파일을 하나씩 복사
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new RuntimeException();	// @transaction 처리가 되도록 강제로 Runtime예외(try절을 강요하지 않는) 발생
				}
			}
		}
	}
}
