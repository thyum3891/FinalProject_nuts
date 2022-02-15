package com.kh.nuts.walking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.nuts.walking.vo.WalkingParty;
import com.kh.nuts.walking.vo.WalkingRequest;

@Mapper
public interface WalkingMapper {
	
	List<WalkingParty> selectWalkingPartyAll(@Param("id") String writer_id);
	List<WalkingParty> selectWalkingPartySearch(@Param("date") String searchDate, @Param("id") String writer_id);
	List<WalkingRequest> selectWalkingReq();
	List<String> selectReqNo();
	int insertWalkingParty(WalkingParty WalkingParty);
	int deleteWalkingParty(@Param("party_no") int party_no);
	int insertWalkingReq(@Param("req_no")String req_no,  @Param("party_no") String party_no, @Param("request_id") String request_id, @Param("respone_id") String respone_id);
	
}
