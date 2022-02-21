package com.kh.nuts.hospital.vo;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import java.io.BufferedReader;

public class HospitalParsing {

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		try {

			HospitalParsing hs = new HospitalParsing();
			int count = Integer.parseInt(hs.totalCount());
//			int count = 10;

			int num = 10;
			for(int i = 1;i*num<=count;i++) {
				hs.parsing(i,num);
			}
			long end = System.currentTimeMillis();
			System.out.println("수행시간: " + (end - start) + " ms");
			System.out.println("끝");
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public String apiXML(int numOfRows, int pageNo) {
		try {

			StringBuilder urlBuilder = new StringBuilder(
					"http://api.kcisa.kr/openapi/service/rest/convergence2019/getConver03"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=4eb498a0-ccae-4f4f-a8af-fbb04948fda0"); /* 서비스키 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode(""+numOfRows, "UTF-8")); /* 세션당 요청레코드수 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(""+pageNo, "UTF-8")); /* 페이지수 */

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

			System.out.println(sb.toString());
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public List<Hospital> parsing(int page, int num) {
		String parsingXml = apiXML(num,page);
		List<Hospital> resultList = new ArrayList<Hospital>();

		List<String> xmlList = new ArrayList<String>(Arrays.asList(parsingXml.split("<item>")));

		for (int i = 1; i < xmlList.size(); i++) {
			String str = xmlList.get(i);
			String rnum = str.substring("<rnum>".length() + str.indexOf("<rnum>"), str.lastIndexOf("</rnum>")).trim();
			String publisher = str.substring("<publisher>".length() + str.indexOf("<publisher>"),
					str.lastIndexOf("</publisher>")).trim();
			String creator = str.substring("<creator>".length() + str.indexOf("<creator>"),
					str.lastIndexOf("</creator>")).trim();
			String title = str.substring("<title>".length() + str.indexOf("<title>"), str.lastIndexOf("</title>")).trim();
			String subjectCategory = str.substring("<subjectCategory>".length() + str.indexOf("<subjectCategory>"),
					str.lastIndexOf("</subjectCategory>")).trim();
			String reference = str.substring("<reference>".length() + str.indexOf("<reference>"),
					str.lastIndexOf("</reference>")).trim();
			String insertDate = str.substring("<insertDate>".length() + str.indexOf("<insertDate>"),
					str.lastIndexOf("</insertDate>")).trim();
			String venue = str.substring("<venue>".length() + str.indexOf("<venue>"), str.lastIndexOf("</venue>")).trim();
			String description = str.substring("<description>".length() + str.indexOf("<description>"),
					str.lastIndexOf("</description>")).trim();
			String state = str.substring("<state>".length() + str.indexOf("<state>"), str.lastIndexOf("</state>")).trim();
			String affiliation = str.substring("<affiliation>".length() + str.indexOf("<affiliation>"),
					str.lastIndexOf("</affiliation>")).trim();

			Hospital result = new Hospital(rnum, publisher, creator, creator, title, subjectCategory, reference,
					reference, insertDate, venue, venue, description, description, state, affiliation, "", "");
			resultList.add(result);
		}

		return resultList;

	}
	public String totalCount() {
		String parsingXml = apiXML(1,1);
		
		String str = parsingXml.split("</items>")[1];
	
			String totalCount = str.substring("<totalCount>".length() + str.indexOf("<totalCount>"), str.lastIndexOf("</totalCount>"));
			
		System.out.println("totalCount : " + totalCount);
		return totalCount;
		
	}
}
