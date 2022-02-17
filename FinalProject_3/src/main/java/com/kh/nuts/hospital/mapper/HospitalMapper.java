package com.kh.nuts.hospital.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kh.nuts.hospital.vo.Hospital;

@Mapper
public interface HospitalMapper {
	int insertHospital(Hospital Hospital);
	int deleteHospital();
}
