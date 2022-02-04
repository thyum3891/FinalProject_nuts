package com.kh.nuts.hospital.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class HospitalComment {

	int hc_no;// 병원 후기 번호
	String id;// 아이디
	String rnum;// 동물병원 번호
	String content;// 내용
	String path;// 사진경로

	
}
