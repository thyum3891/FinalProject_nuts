package com.kh.nuts.hotdog.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.hotdog.mapper.HotdogMapper;
import com.kh.nuts.hotdog.vo.Hotdog;
import com.kh.nuts.hotdog.vo.HotdogLike;

@Service
public class HotdogServiceImpl implements HotdogService {

	@Autowired
	HotdogMapper mapper;

	@Override
	public Hotdog selectHotdogDetail(String hot_no) {
		return mapper.selectHotdogDetail(hot_no);
	}

	@Override
	public int deleteHotdog(String hot_no) {
		return mapper.deleteHotdog(hot_no);
	}

	@Override
	public int updateHotdog(Hotdog hotdog) {
		return mapper.updateHotdog(hotdog);
	}

	@Override
	public int insertHotdog(Hotdog hotdog) {
		return mapper.insertHotdog(hotdog);
	}

	@Override
	public int selectCount(String title, String nick_name) {
		return mapper.selectCount(title, nick_name);
	}

	@Override
	public List<Hotdog> selectHotdogList(PageInfo pageInfo, String title, String nick_name) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectHotdogList(rowBounds, title, nick_name);
	}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		File folder = new File(savePath);

		if (folder.exists() == false) {
			folder.mkdirs();
		}

		String originalFileName = upfile.getOriginalFilename();
		String reNameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
				+ originalFileName.substring(originalFileName.lastIndexOf("."));
		String reNamePath = savePath + "/" + reNameFileName;

		try {
			upfile.transferTo(new File(reNamePath));
		} catch (Exception e) {
			return null;
		}

		return reNameFileName;
	}

	@Override
	public int deleteLike(String hl_like) {

		return mapper.deleteLike(hl_like);
	}

	@Override
	public int insertLike(HotdogLike hotdogLike) {
		String hl_id = hotdogLike.getHot_no() + hotdogLike.getMember_id();
		hotdogLike.setHl_id(hl_id);
		return mapper.insertLike(hotdogLike);
	}

	@Override
	public HotdogLike selectLike(String hl_id) {
		System.out.println(hl_id);
		return mapper.selectLike(hl_id);
	}

}
