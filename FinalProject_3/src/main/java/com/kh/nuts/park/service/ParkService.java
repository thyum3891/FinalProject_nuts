package com.kh.nuts.park.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.nuts.hospital.vo.Hospital;
import com.kh.nuts.park.vo.Park;

public interface ParkService {
	int insertPark(Park park);
	int deletePark();
	
}
