package com.kh.nuts.working.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class WalkingRec {

	int rec_no;// 추천산책로 번호
	String manageno;// 관리번호
	String course;// 코스 좌표
	String content;// 내용
	String time;// 예상 소요시간
	String amenitie;// 시설

}
