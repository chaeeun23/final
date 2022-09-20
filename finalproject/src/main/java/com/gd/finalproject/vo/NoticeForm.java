package com.gd.finalproject.vo;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class NoticeForm {
	private Notice notice;
	private List<MultipartFile> multiList;
	
}
