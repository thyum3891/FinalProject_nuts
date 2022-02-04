package com.kh.nuts.weather.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class Weather {
	String baseDate;
	String baseTime;
	String category;
	String fcstDate;
	String fcstTime;
	String fcstValue;
	String nx;
	String ny;

//	baseDate 
//	baseTime 
//	category 
//	fcstDate 
//	fcstTime 
//	fcstValue
//	nx       
//	ny       

}
