package com.kh.nuts.mapVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class ParkVO {
	String manageNo; // 관리번호
	String parkNm; // 공원명
	String lnmadr; // 소재지 지번 주소
	String rdnmadr; // 소재지도로명주소
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
