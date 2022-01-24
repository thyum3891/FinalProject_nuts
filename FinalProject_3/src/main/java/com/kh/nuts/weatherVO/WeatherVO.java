package com.kh.nuts.weatherVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class WeatherVO {
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
