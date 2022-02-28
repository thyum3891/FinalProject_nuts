package com.kh.nuts.notice.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Notice {
	String notice_no;        //공지사항 번호
	String title;         //제목
	String content;       //내용
	String filename;      //파일명
	String re_filename;   //파일명_변경
	String write_date;
	String writer;
	String nick_name;
	String profile;
}
