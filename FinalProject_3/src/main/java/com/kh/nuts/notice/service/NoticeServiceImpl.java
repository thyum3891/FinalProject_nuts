package com.kh.nuts.notice.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.notice.mapper.NoticeMapper;
import com.kh.nuts.notice.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveNotice(Notice notice) {
		int result = 0;

		if (notice.getNotice_no() == null) {
			result = mapper.insertNotice(notice);
		} else {
			result = mapper.updateNotice(notice);
		}
		return result;
	}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		
		File folder = new File(savePath);

		if (folder.exists() == false) {
			folder.mkdirs();
		}

		System.out.println("savePath : " + savePath);

		String fileName = upfile.getOriginalFilename();
		String re_FileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
				+ fileName.substring(fileName.lastIndexOf("."));
		String reNamePath = savePath + "/" + re_FileName;

		// 업로드 된 파일 이름을 바꾸고, 실제 디스크에 저장하는 코드부
		try {
			upfile.transferTo(new File(reNamePath));
		} catch (Exception e) {
			return null;
		}

		return re_FileName;
	}

	@Override
	public int getNoticeCount(String quary, String date) {
		
		return mapper.selectNoticeCount(quary, date);
	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo, String quary, String date) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectNoticeList(rowBounds, quary, date);
	}

	@Override
	public void deleteFile(String filePath) {
		File file = new File(filePath);
		if (file.exists()) {
			file.delete();
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteNotice(String notice_no) {
		Notice notice = mapper.selectNoticeByNo(notice_no);
		try {
			File file = new File(notice.getRe_filename());
			if (file.exists()) {
				file.delete();
			}
		} catch (Exception e) {}
		return mapper.deleteNotice(notice_no);
	}

	@Override
	public Notice findByNo(String notice_no) {
		
		return mapper.selectNoticeByNo(notice_no);
	}

}
