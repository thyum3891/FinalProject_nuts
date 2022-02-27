package com.kh.nuts.walking.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.nuts.walking.vo.WalkingParty;
import com.kh.nuts.walking.vo.WalkingRequest;

public interface WalkingService {
	List<WalkingParty> selectAll(String lat, String lng, String id);
	List<WalkingParty> selectAll(String id);
	List<WalkingParty> selectMyParty(String writer_id);
	List<WalkingParty> selectSearch(String lat, String lng, String searchDate, String writer_id);
	List<WalkingParty> selectSearch(String searchDate, String writer_id);
	int insertWorkingParty(WalkingParty workingParty);
	int deleteWorkingParty(int party_no);
	boolean insertWalkingReq(String party_no, String reqId, String respId);
	List<WalkingRequest> selectWalkingReq();
	String selectReqNo();
	List<WalkingRequest> selectReqIdInfo(String party_no);
	boolean partyReqUdate(String req_no, String stat);
	boolean partyStatUdate(String party_no);
	List<WalkingRequest> selectWalkingPartner(String myId);
	int ReqCount(String party_no);
}
