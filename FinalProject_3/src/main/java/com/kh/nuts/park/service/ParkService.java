package com.kh.nuts.park.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.park.vo.Park;

public interface ParkService {
	
	String saveFile(MultipartFile upfile, String savePath);
	
	void deleteFile(String filePath);
	
	int getParkCount(String addr);

	List<Park> getParkList(String lat, String lng, String addr);
	
	Park findByParkNm(String parkNm);
	
	int insertPark(Park park);
	
	int deletePark();

}
