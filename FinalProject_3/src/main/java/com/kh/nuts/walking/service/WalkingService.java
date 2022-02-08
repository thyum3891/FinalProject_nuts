package com.kh.nuts.walking.service;

import java.util.List;


import com.kh.nuts.working.vo.WalkingParty;

public interface WalkingService {
	List<WalkingParty> selectAll(double lat, double lng);
	List<WalkingParty> selectSearch(double lat, double lng, String searchDate, String writer_id);
	int insertWorkingParty(WalkingParty workingParty);
	int deleteWorkingParty(int party_no);
}
