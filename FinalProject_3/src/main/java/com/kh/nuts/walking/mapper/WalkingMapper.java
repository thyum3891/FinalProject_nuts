package com.kh.nuts.walking.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.nuts.walking.vo.WalkingParty;

@Mapper
public interface WalkingMapper {
	
	List<WalkingParty> selectWalkingPartyAll();
	List<WalkingParty> selectWalkingPartySearch(@Param("date") String searchDate, @Param("id") String writer_id);
	int insertWalkingParty(WalkingParty WalkingParty);
	int deleteWalkingParty(@Param("party_no") int party_no);
}
