package com.kh.nuts.weatherVO;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import java.io.BufferedReader;

public class WeatherParsing {

	public static void main(String[] args) {
		WeatherParsing wp = new WeatherParsing();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		wp.parsing(sdf.format(new Date()), "55", "127");
	}

	public Map<String, Map<String, String>> parsing(String date, String x, String y) {
		Map<String, Map<String, String>> resultMap = new HashMap<String, Map<String, String>>();
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=p%2FEQ%2FM6%2F9VgLHa891Kr%2ByDbmX44MVfPjjcl%2Fa3%2BqCb0tT3sYqrfo0Gjlo950lOvzad9Tvm675fKPYsUq0dMPPQ%3D%3D"); /*
																																	 * Service
																																	 * Key
																																	 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("1000", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
					+ URLEncoder.encode("json", "UTF-8")); /* 요청자료형식(XML/JSON) Default: XML */
			urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "="
					+ URLEncoder.encode(date, "UTF-8")); /* ‘21년 6월 28일발표 */
			urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "="
					+ URLEncoder.encode("0500", "UTF-8")); /* 05시 발표 */
			urlBuilder.append(
					"&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(x, "UTF-8")); /* 예보지점의 X 좌표값 */
			urlBuilder.append(
					"&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(y, "UTF-8")); /* 예보지점의 Y 좌표값 */
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			System.out.println(sb.toString());
			String weaterJson = sb.toString();

			
			String[] passingSplit = weaterJson.split("\"item\":\\[");
			passingSplit = passingSplit[1].split("\\}\\]\\}");
			passingSplit = passingSplit[0].split("}");
			for (int i = 0; i < passingSplit.length; i++) {
				passingSplit[i] = passingSplit[i].replace(",{", "").replace("{", "");
			}
			String[][] rowDataArr = new String[passingSplit.length][];
			for (int i = 0; i < passingSplit.length; i++) {
				rowDataArr[i] = passingSplit[i].split("\",\"");
				for (int j = 0; j < rowDataArr[i].length; j++) {
					rowDataArr[i][j] = rowDataArr[i][j].replaceAll("<b>", "").replaceAll("</b>", "")
							.replaceAll("&quot;", "").strip();
				}
			}

			List<Map<String, String>> jsonList = new ArrayList<Map<String, String>>();

			for (int i = 0; i < rowDataArr.length; i++) {
				Map<String, String> parsingMap = new HashMap<String, String>();
				for (int j = 0; j < rowDataArr[i].length; j++) {
					String[] rowDataInfo = rowDataArr[i][j].split("\":");

					parsingMap.put(rowDataInfo[0].replaceAll("\"", "").strip(),
							rowDataInfo[1].replaceAll("\"", "").strip());
				}
				jsonList.add(parsingMap);

			}
// 맵(시간,맵(날씨))
			
			for (int i = 0; i < jsonList.size(); i++) {
				Map<String, String> weatherMap = new HashMap<String, String>();
				String fcstTime = jsonList.get(i).get("fcstTime");// 6
				if(resultMap.containsKey(fcstTime)){
					continue;
				}
				
				
				
				for (int j = 0; j < jsonList.size(); j++) {

					String fcstTime2 = jsonList.get(j).get("fcstTime");

					if (fcstTime.equals(fcstTime2) == false ) {
						continue;
					}
					
					String category = jsonList.get(j).get("category");		
					if(category.equals("T1H")) {
						category = "기온";
					}else if(category.equals("RN1")){
						category = "1시간 강수량";						
					}else if(category.equals("SKY")){
						category = "하늘상태";						
					}else if(category.equals("UUU")){
						category = "동서바람성분";						
					}else if(category.equals("VVV")){
						category = "남북바람성분";						
					}else if(category.equals("REH")){
						category = "습도";						
					}else if(category.equals("PTY")){
						category = "강수형태";						
					}else if(category.equals("LGT")){
						category = "낙뢰";						
					}else if(category.equals("VEC")){
						category = "풍향";						
					}else if(category.equals("WSD")){
						category = "풍속";						
					}
					String fcstValue = jsonList.get(j).get("fcstValue");					
					weatherMap.put(category, fcstValue);
//				T1H	기온
//				RN1	1시간 강수량
//				SKY	하늘상태
//				UUU	동서바람성분
//				VVV	남북바람성분
//				REH	습도
//				PTY	강수형태
//				LGT	낙뢰
//				VEC	풍향
//				WSD	풍속

					
				}
				System.out.println(fcstTime +" : "+weatherMap);
				resultMap.put(fcstTime, weatherMap);

			}
			
			return resultMap;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}

//	baseDate 
//	baseTime 
//	category 
//	fcstDate 
//	fcstTime 
//	fcstValue
//	nx       
//	ny       
