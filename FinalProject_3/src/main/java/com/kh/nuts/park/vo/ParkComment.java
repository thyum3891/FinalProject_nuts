package com.kh.nuts.park.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class ParkComment {

	int pc_no; // 공원 후기 번호
	String manageno; // 관리번호
	String id; // 아이디
	String content; // 내용
	String path; // 사진경로

}
