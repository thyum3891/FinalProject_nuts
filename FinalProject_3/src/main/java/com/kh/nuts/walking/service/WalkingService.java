package com.kh.nuts.walking.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.nuts.walking.vo.WalkingParty;
import com.kh.nuts.walking.vo.WalkingRequest;

public interface WalkingService {
	List<WalkingParty> selectAll(String lat, String lng, String id);
	List<WalkingParty> selectSearch(String lat, String lng, String searchDate, String writer_id);
	int insertWorkingParty(WalkingParty workingParty);
	int deleteWorkingParty(int party_no);
	boolean insertWalkingReq(String party_no, String reqId, String respId);
	List<WalkingRequest> selectWalkingReq();
	String selectReqNo();
}
