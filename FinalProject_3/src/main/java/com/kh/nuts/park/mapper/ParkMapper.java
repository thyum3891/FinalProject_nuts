package com.kh.nuts.park.mapper;

import org.springframework.stereotype.Repository;

import com.kh.nuts.park.vo.Park;

@Repository

public interface ParkMapper {
	int insertPark(Park Park);
	int deletePark();
}
