package com.gd.finalproject.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
		
		// 조회수 카운트
        noticeMapper.showUp(noticeNo);
        log.debug(TeamColor.YW + "조회수 noticeNo : " + noticeNo);

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
				
				// noticefile 세팅
				noticefile.setFileName(filename + mf.getOriginalFilename());
				noticefile.setOriginalFileName(mf.getOriginalFilename());
				noticefile.setFileType(mf.getContentType());
				noticefile.setFileSize(mf.getSize());
				log.debug(TeamColor.YW + "noticefile : " + noticefile);

				noticeFileMapper.insertNoticeFile(noticefile);
				
				// 파일 확장자 구하기
				String ext = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				log.debug(TeamColor.YW + "mf.getOriginalFilename() : " + mf.getOriginalFilename());
				log.debug(TeamColor.YW + "파일 확장자 : " + ext);
				
				log.debug(TeamColor.YW + "noticefile.getFileName() : " + noticefile.getFileName());
				
				try {
					mf.transferTo(new File(path + File.separator + noticefile.getFileName()));	// c:/upload/filename.ext 새로운 빈 파일 안에 MultipartFile안에 파일을 하나씩 복사
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new RuntimeException();	// @transaction 처리가 되도록 강제로 Runtime예외(try절을 강요하지 않는) 발생
				}
			}
		}
	}
	
	// 첨부파일 다운로드
	public ResponseEntity<Object> downloadNoticeFile(String fileName, String realPath) {

		try {
			
			//path의 경로 객체 생성
			Path filePath = Paths.get(realPath);
			
			// 파일 resource 얻기
			Resource resource = new InputStreamResource(Files.newInputStream(filePath)); 
			
			//파일 객체 생성
			File file = new File(realPath);
			
			//헤더 객체 생성
			HttpHeaders headers = new HttpHeaders();
			
			// 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더			
			headers.setContentDisposition(ContentDisposition.builder("attachment").filename(file.getName()).build());  
			
			//결과 확인 디버깅
			log.debug(TeamColor.YW + "결과 확인 / 파일 다운로드 성공");
			
			//리턴
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		} catch(Exception e) {
			//결과확인 디버깅
			log.debug(TeamColor.YW + "결과 확인 / 파일 다운로드 실패");
			
			//리턴
			return new ResponseEntity<Object>(null, HttpStatus.CONFLICT);
		}
		
	}
	
	// 공지사항 삭제 + 파일삭제
    public int removeNotice(int noticeNo) {
    	
    	// 파일 삭제
    	int deleteNoticeFile = noticeFileMapper.deleteNoticeFile(noticeNo);
    	log.debug(TeamColor.YW + "NoticeService.deleteNoticeFile : " + deleteNoticeFile);
    	
    	// 강좌 삭제
    	int deleteNotice= noticeMapper.deleteNotice(noticeNo);
        log.debug(TeamColor.YW + "NoticeService.deleteNotice: " + deleteNotice);
    	
    	return deleteNotice;
    }
	
}
