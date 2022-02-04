package com.kh.nuts.working.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class WorkingParty {

	int party_no;                // 모임 번호
	String writer_id;            // 작성자
	String pathone;              // 첫좌표
	String pathall;              // 모든좌표
	String contant;              // 내용
	String start;                // 시작 시간
	String time;                 // 예상 소요 시간
	String distance;             // 거리
	String stat;                 // 상태

}
