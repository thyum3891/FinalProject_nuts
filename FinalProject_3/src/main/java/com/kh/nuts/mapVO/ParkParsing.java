package com.kh.nuts.mapVO;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import java.io.BufferedReader;

public class ParkParssing {
	String count = null;
	int i = 1;
	int num = 100;

	public List<ParkVO> passing() {
		String parkJson = "";
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://api.data.go.kr/openapi/tn_pubr_public_cty_park_info_api"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=p%2FEQ%2FM6%2F9VgLHa891Kr%2ByDbmX44MVfPjjcl%2Fa3%2BqCb0tT3sYqrfo0Gjlo950lOvzad9Tvm675fKPYsUq0dMPPQ%3D%3D");
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("i", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("100", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
					+ URLEncoder.encode("json", "UTF-8")); 
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
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
			parkJson = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<ParkVO> resultList = new ArrayList<ParkVO>();
		String[] passingSplit = parkJson.split("\"items\":\\[");
		passingSplit = passingSplit[1].split("\\}\\]");
		if (count == null) {
			String totalCount = passingSplit[1].split(",")[1];
			totalCount = totalCount.split("\"totalCount\": \"")[1].replaceAll("\"", "");
			count = totalCount;
		}
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
			Map<String, String> shoppingMap = new HashMap<String, String>();
			for (int j = 0; j < rowDataArr[i].length; j++) {
				String[] rowDataInfo = rowDataArr[i][j].split("\":");

				shoppingMap.put(rowDataInfo[0].replaceAll("\"", "").strip(),
						rowDataInfo[1].replaceAll("\"", "").strip());
			}
			jsonList.add(shoppingMap);

		}

		for (int i = 0; i < jsonList.size(); i++) {

			String manageNo = jsonList.get(i).get("manageNo");
			String parkNm = jsonList.get(i).get("parkNm");
			String rdnmadr = jsonList.get(i).get("rdnmadr");
			String lnmadr = jsonList.get(i).get("lnmadr");
			String latitude = jsonList.get(i).get("latitude");
			String longitude = jsonList.get(i).get("longitude");
			String parkAr = jsonList.get(i).get("parkAr");
			String mvmFclty = jsonList.get(i).get("mvmFclty");
			String amsmtFclty = jsonList.get(i).get("amsmtFclty");
			String cnvnncFclty = jsonList.get(i).get("cnvnncFclty");
			String cltrFclty = jsonList.get(i).get("cltrFclty");
			String etcFclty = jsonList.get(i).get("etcFclty");
			String appnNtfcDate = jsonList.get(i).get("appnNtfcDate");
			String institutionNm = jsonList.get(i).get("institutionNm");
			String phoneNumber = jsonList.get(i).get("phoneNumber");
			String referenceDate = jsonList.get(i).get("referenceDate");
			String insttCode = jsonList.get(i).get("insttCode");

			ParkVO result = new ParkVO(manageNo, parkNm, rdnmadr, lnmadr, latitude, longitude, parkAr, mvmFclty, amsmtFclty, cnvnncFclty, cltrFclty, etcFclty, appnNtfcDate, institutionNm, phoneNumber, referenceDate, insttCode);
			resultList.add(result);
		}
		return resultList;

	}
}
