package com.kh.nuts.hotdog.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Hotdog {

	int hot_no;// 핫도그 번호
	String title;// 제목
	String content;// 내용
	String filename;// 파일명
	String re_filename;// 파일명_변경
	String write_date;// 작성일
	String write;// 작성자
	String nick_name;
	String profile;
	String kakao;
	int count;

}
