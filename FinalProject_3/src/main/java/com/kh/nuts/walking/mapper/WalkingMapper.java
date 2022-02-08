package com.kh.nuts.walking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.nuts.working.vo.WalkingParty;

@Mapper
public interface WalkingMapper {
	
	List<WalkingParty> selectWalkingPartyAll();
	List<WalkingParty> selectWalkingPartySearch(@Param("searchDate") String searchDate, @Param("writer_id") String writer_id);
	int insertWalkingParty(WalkingParty WalkingParty);
	int deleteWalkingParty(@Param("party_no") int party_no);
}
