package com.kh.nuts.hotdog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.kh.nuts.hotdog.vo.Hotdog;
import com.kh.nuts.hotdog.vo.HotdogLike;

@Repository
public interface HotdogMapper {
	List<Hotdog> selectHotdogList(RowBounds rowBounds, @Param("title")String title, @Param("nick_name")String nick_name);
	Hotdog selectHotdogDetail(@Param("hot_no")String hot_no);
	int deleteHotdog(@Param("hot_no")String hot_no);
	int updateHotdog(Hotdog hotdog);
	int insertHotdog(Hotdog hotdog);
	int deleteLike(@Param("hl_id")String hl_id);
	int insertLike(HotdogLike hotdogLike);
	int selectCount(@Param("title")String title, @Param("nick_name")String nick_name);
	HotdogLike selectLike(@Param("hl_id")String hl_id);
	
}
