package com.kh.nuts.hotdog.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.hotdog.vo.Hotdog;
import com.kh.nuts.hotdog.vo.HotdogLike;

public interface HotdogService {
	List<Hotdog> selectHotdogList(PageInfo pageInfo,String tile, String nick_name);
	Hotdog selectHotdogDetail(String hot_no);
	int deleteHotdog(String hot_no);
	int updateHotdog(Hotdog hotdog);
	int insertHotdog(Hotdog hotdog);
	int selectCount(String title, String nick_name);
	String saveFile(MultipartFile upfile, String savePath);
	int deleteLike(String hl_id);
	int insertLike(HotdogLike hotdogLike);
	HotdogLike selectLike(String hl_id);
}
