package com.kh.nuts.walking.service;

import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nuts.walking.mapper.WalkingMapper;
import com.kh.nuts.walking.vo.WalkingParty;
import com.kh.nuts.walking.vo.WalkingRequest;


@Service
public class WalkingServiceImpl implements WalkingService {

	@Autowired
	private WalkingMapper mapper;

	@Override
	public List<WalkingParty> selectAll(String lat, String lng, String id) {
		List<WalkingParty> list = mapper.selectWalkingPartyAll(id);

		list.sort(new Comparator<WalkingParty>() {

			@Override
			public int compare(WalkingParty o1, WalkingParty o2) {
				String[] o1Path = o1.getPathOne().replaceAll("\\(", "").replaceAll("\\)", "").split(",");
				String[] o2Path = o2.getPathOne().replaceAll("\\(", "").replaceAll("\\)", "").split(",");

				int result = (int) Math.round(distance(Double.parseDouble(lat), Double.parseDouble(lng), Double.parseDouble(o1Path[0].trim()),
						Double.parseDouble(o1Path[1].trim()))) 
						- (int) Math.round(distance(Double.parseDouble(lat), Double.parseDouble(lng), Double.parseDouble(o2Path[0].trim()),
								Double.parseDouble(o2Path[1].trim()))); 
				return result;
			}
		});

		return list;
	}

	@Override
	public List<WalkingParty> selectSearch(String lat, String lng, String searchDate, String writer_id) {

		List<WalkingParty> list = mapper.selectWalkingPartySearch(searchDate, "%"+writer_id+"%");

		list.sort(new Comparator<WalkingParty>() {

			@Override
			public int compare(WalkingParty o1, WalkingParty o2) {
				String[] o1Path = o1.getPathOne().replaceAll("\\(", "").replaceAll("\\)", "").split(",");
				String[] o2Path = o2.getPathOne().replaceAll("\\(", "").replaceAll("\\)", "").split(",");

				int result = (int) Math.round(distance(Double.parseDouble(lat), Double.parseDouble(lng), Double.parseDouble(o1Path[0].trim()),
						Double.parseDouble(o1Path[1].trim()))) 
						- (int) Math.round(distance(Double.parseDouble(lat), Double.parseDouble(lng), Double.parseDouble(o2Path[0].trim()),
								Double.parseDouble(o2Path[1].trim()))); 
				return result;
			}
		});

		return list;
	}

	@Override
	public int insertWorkingParty(WalkingParty workingParty) {
		return mapper.insertWalkingParty(workingParty);
	}

	@Override
	public int deleteWorkingParty(int party_no) {
		return mapper.deleteWalkingParty(party_no);
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

	@Override
	public boolean insertWalkingReq(String party_no, String reqId, String respId) {
		String req_no = party_no + reqId;
		
		int result = mapper.insertWalkingReq(req_no,party_no, reqId, respId);
		
		if (result > 0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public String selectReqNo() {
		String reqStr = mapper.selectReqNo().toString();
		return reqStr;
	}

	@Override
	public List<WalkingRequest> selectWalkingReq() {
		return mapper.selectWalkingReq();
	}

	
}
