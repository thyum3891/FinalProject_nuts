package com.kh.nuts.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.notice.vo.Notice;

public interface NoticeService {
	int saveNotice(Notice notice);
	
	String saveFile(MultipartFile upfile, String savePath);

	int getNoticeCount(String quary, String date);
	
	
	List<Notice> getNoticeList(PageInfo pageInfo, String quary, String date);

	Notice findByNo(String noticeNo);

	void deleteFile(String filePath);
	
	int deleteNotice(String notice_no);

}
