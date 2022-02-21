package com.kh.nuts.park.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nuts.park.mapper.ParkMapper;
import com.kh.nuts.park.vo.Park;

@Service
public class ParkServiceImpl implements ParkService {

	@Autowired
	ParkMapper mapper;
	
	@Override
	public int insertPark(Park park) {
		return mapper.insertPark(park);
	}

	@Override
	public int deletePark() {
		
		return mapper.deletePark();
	}

	

}
