package com.kh.nuts.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;



import com.kh.nuts.notice.vo.Notice;

public interface NoticeMapper {

	List<Notice> selectNoticeList(RowBounds rowBounds, @Param("quary")String quary, @Param("date")String date);
	
	int selectNoticeCount(@Param("quary")String quary, @Param("date")String date);
	
	Notice selectNoticeByNo(@Param("notice_no")String notice_no);
	
	int insertNotice(Notice notice);

	int updateNotice(Notice notice);
	
	int updateReadCount(Notice notice);

	int deleteNotice(@Param("notice_no")String notice_no);
	
}
