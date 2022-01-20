package com.kh.nuts.shopping;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test {
		
	    private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
	    
	    public List<ShoppingVO> passing() {
	    	
	    	String clientId = "4BZohPFKsut7txhjOW2T";
	        String clientSecret = "EGh4XdNsa5"; 


	        String text = null;
	        try {
	            text = URLEncoder.encode("애견 산책", "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }


	        String apiURL = "https://openapi.naver.com/v1/search/shop.json?display=100&query=" + text;  


	        Map<String, String> requestHeaders = new HashMap<String, String>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String shoppingJson = get(apiURL,requestHeaders);
		
		List<ShoppingVO> resultList = new ArrayList<ShoppingVO>();
		String[] passingSplit = shoppingJson.split("\"items\": \\["); // 앞 잉여데이터 삭제
		passingSplit = passingSplit[1].split("\\]\\}"); // 뒤 잉여데이터 삭제
		passingSplit = passingSplit[0].split("}"); // 각 아이템별로 데이터 나누기
		for (int i = 0; i < passingSplit.length; i++) {
			passingSplit[i] = passingSplit[i].replace(",{", "").replace("{", ""); // 괄호 삭제
		}
		String[][] rowDataArr = new String[passingSplit.length][]; // ROW데이터를 담기위한 2차원 배열
		for (int i = 0; i < passingSplit.length; i++) {
			rowDataArr[i] = passingSplit[i].split("\",\""); // 따움표 삭제
			for (int j = 0; j < rowDataArr[i].length; j++) {
				rowDataArr[i][j] = rowDataArr[i][j].replaceAll("<b>", "").replaceAll("</b>", "") // DB에 담을 값에서 필요 없는
																									// HTML 삭제
						.replaceAll("&quot;", "").strip(); // 필요없는 코드 및 앞 뒤 공백 삭제
			}
		}

		List<Map<String, String>> jsonList = new ArrayList<Map<String, String>>(); // ROW데이터로 분리될 객체MAP을 담을 LIST

		for (int i = 0; i < rowDataArr.length; i++) {
			Map<String, String> shoppingMap = new HashMap<String, String>(); // ROW데이터를 분리할 맵
			for (int j = 0; j < rowDataArr[i].length; j++) {
				String[] rowDataInfo = rowDataArr[i][j].split("\":"); // :로만 나누면 엉뚱하게 나눠지는 내용도 있어 ": 로 스플릿

				shoppingMap.put(rowDataInfo[0].replaceAll("\"", "").strip(), rowDataInfo[1].replaceAll("\"", "").strip()); // 이후
																														// 값에서
																														// 따움표
																														// 삭제
			}
			jsonList.add(shoppingMap); // 아이템별로 MAP값 입력 for문이 돌면서 다시 map을 생성하니 참조ID가 달라서 중복 안됨

		}

		for (int i = 0; i < jsonList.size(); i++) {

			String title = jsonList.get(i).get("title");
			String link = jsonList.get(i).get("link").replaceAll("gate.nhn\\?id\\=", "catalog/");
			String image = jsonList.get(i).get("image");
			String lprice = jsonList.get(i).get("lprice");
			String hprice = jsonList.get(i).get("hprice");
			String mallName = jsonList.get(i).get("mallName");
			String productId = jsonList.get(i).get("productId");
			String productType = jsonList.get(i).get("productType");
			String maker = jsonList.get(i).get("maker");
			String brand = jsonList.get(i).get("brand");
			String category1 = jsonList.get(i).get("category1");
			String category2 = jsonList.get(i).get("category2");
			String category3 = jsonList.get(i).get("category3");
			String category4 = jsonList.get(i).get("category4");

			ShoppingVO svo = new ShoppingVO(title, link, image, lprice, hprice, mallName, productId, productType, maker, brand, category1, category2, category3, category4);
		
			resultList.add(svo);
		}
		
		return resultList;
	
	}
	public static void main(String[] args) {
		new test().passing();
	}
}
