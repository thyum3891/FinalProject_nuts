package com.kh.nuts.walking.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class WalkingParty {

	String party_no; // 모임 번호
	String writer_id; // 작성자
	String pathOne; // 첫좌표
	String[] pathAll; // 모든좌표
	String contant; // 내용
	String creat_date ; // 만든날짜
	String start_date; // 모임 시작 날짜
	String start_time; // 시작 시간
	String estimated_time; // 예상 소요 시간
	String distance; // 거리
	String stat; // 상태
	String nick_name; // 상태
	String profile;
	double avg; // 상태

}