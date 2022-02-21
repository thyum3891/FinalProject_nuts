package com.kh.nuts.hospital.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.nuts.hospital.vo.Hospital;

@Mapper
public interface HospitalMapper {
	int insertHospital(Hospital Hospital);
	int deleteHospital();
	List<Hospital> selectHospitalBySearch(RowBounds rowBounds, @Param("addr")String addr, @Param("title")String title);
	int selectCountbyHospital(@Param("addr")String addr, @Param("title")String title);
	List<Hospital> selectHospital(@Param("addr")String addr, @Param("title")String title);
}
