package com.kh.nuts.working.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class WorkingCourse {
	int NO;// 참여 신청 번호
	String party_no;// 모임 번호
	String member_id;// 아이디
	String contatnt;// 신청서 내용
	String stat;//상태

}
