package com.kh.nuts.park.service;

import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.park.mapper.ParkMapper;
import com.kh.nuts.park.vo.Park;

@Service
public class ParkServiceImpl implements ParkService {

	@Autowired
	private ParkMapper mapper;
	
	@Override
	public List<Park> getParkList(String lat, String lng, String addr) {
		List<Park> list = mapper.selectParkList(addr);
		list.sort(new Comparator<Park>() {
			@Override
			public int compare(Park o1, Park o2) {
				String o1Lat = o1.getLatitude().trim();
				String o1Lng = o1.getLongitude().trim();
				String o2Lat = o2.getLatitude().trim();
				String o2Lng = o2.getLongitude().trim();
				int result = (int) Math.round(distance(Double.parseDouble(lat), Double.parseDouble(lng), Double.parseDouble(o1Lat),	Double.parseDouble(o1Lng))) 
						- (int) Math.round(distance(Double.parseDouble(lat), Double.parseDouble(lng), Double.parseDouble(o2Lat), Double.parseDouble(o2Lng))); 
				return result;
			}
		});

		
		return list;
	}

	@Override
	public int getParkCount(String addr) {
		
		return mapper.selectParkCount(addr);
	}
	
	@Override
	public Park findByParkNm(String parkNm) {
		Park park = mapper.selectByParkNm(parkNm);
		
		return park;
	}
	
	@Override
	public int insertPark(Park park) {
		return mapper.insertPark(park);
	}

	@Override
	public int deletePark() {
		
		return mapper.deletePark();
	}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteFile(String filePath) {
		// TODO Auto-generated method stub
		
	}

	private double distance(double lat1, double lon1, double lat2, double lon2) {

		double theta = lon1 - lon2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		dist = dist * 1609.344; // m로 계산

		return (dist);
	}

	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}


}
