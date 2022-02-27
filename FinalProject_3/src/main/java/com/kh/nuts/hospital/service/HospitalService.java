package com.kh.nuts.hospital.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.common.util.PageInfo;
import com.kh.nuts.hospital.vo.Hospital;

public interface HospitalService {
	int insertHospital(Hospital hospital);
	int deleteHospital();
	List<Hospital> selectHospitalBySearch(String addr, String title, PageInfo pageInfo);
	int selectCountbyHospital(String addr, String title);
	List<Hospital> selectHospital(String addr, String title);
	String saveFile(MultipartFile upfile, String savePath);
}
