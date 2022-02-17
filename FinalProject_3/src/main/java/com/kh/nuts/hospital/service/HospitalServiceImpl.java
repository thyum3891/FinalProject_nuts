package com.kh.nuts.hospital.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nuts.hospital.mapper.HospitalMapper;
import com.kh.nuts.hospital.vo.Hospital;

@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	HospitalMapper mapper;
	
	@Override
	public int insertHospital(Hospital hospital) {
		return mapper.insertHospital(hospital);
	}

	@Override
	public int deleteHospital() {
		return mapper.deleteHospital();
	}

}
