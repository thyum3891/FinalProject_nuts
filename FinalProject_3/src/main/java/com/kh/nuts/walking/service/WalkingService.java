package com.kh.nuts.walking.service;

import java.util.List;

import com.kh.nuts.walking.vo.WalkingParty;

public interface WalkingService {
	List<WalkingParty> selectAll(double lat, double lng);
	List<WalkingParty> selectSearch(String lat, String lng, String searchDate, String writer_id);
	int insertWorkingParty(WalkingParty workingParty);
	int deleteWorkingParty(int party_no);
}
