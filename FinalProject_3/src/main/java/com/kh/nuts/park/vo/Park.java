package com.kh.nuts.park.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Park {
	String manageNo; // 관리번호
	String parkNm; // 공원명
	String rdnmadr; // 소재지도로명주소
	String inmadr;
	String latitude; // 위도
	String longitude; // 경도
	String parkAr; // 공원면적
	String institutionNm; // 관리기관명
	String phoneNumber; // 전화번호 
	String referenceDate; // 데이터 기준일
	String insttCode; // 제공기관코드

//	parkNm
//	rdnmadr
//	lnmadr
//	latitude
//	longitude
//	parkAr
//	mvmFclty
//	amsmtFclty
//	cnvnncFclty
//	cltrFclty
//	etcFclty
//	appnNtfcDate
//	institutionNm
//	phoneNumber
//	referenceDate
//	insttCode
//	
}
