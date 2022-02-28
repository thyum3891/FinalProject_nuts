package com.kh.nuts.park.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kh.nuts.park.vo.Park;

@Repository
@Mapper
public interface ParkMapper {
	
	List<Park> selectParkList(@Param("addr")String addr);
	
	int selectParkCount(@Param("addr")String addr);
	
	Park selectByParkNm(String parkNm);
	
	int insertPark(Park park);
	
	int deletePark();
}
