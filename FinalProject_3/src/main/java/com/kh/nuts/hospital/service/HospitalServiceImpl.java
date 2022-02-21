package com.kh.nuts.hospital.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.common.util.PageInfo;
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
	@Override
	public List<Hospital> selectHospitalBySearch(String addr, String title, PageInfo pageInfo) {
		StringBuilder str1 = new StringBuilder();
		str1.append("%");
		str1.append(addr);
		str1.append("%");
		System.out.println(str1.toString());
		StringBuilder str2 = new StringBuilder();
		str2.append("%");
		str2.append(title);
		str2.append("%");
		System.out.println(str2.toString());
		
		addr = str1.toString();
		title = str2.toString();
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		
		return mapper.selectHospitalBySearch(rowBounds,addr, title);
	}

	@Override
	public int selectCountbyHospital(String addr, String title) {
		
		StringBuilder str1 = new StringBuilder();
		str1.append("%");
		str1.append(addr);
		str1.append("%");
		System.out.println(str1.toString());
		StringBuilder str2 = new StringBuilder();
		str2.append("%");
		str2.append(title);
		str2.append("%");
		System.out.println(str2.toString());
		
		addr = str1.toString();
		title = str2.toString();
		
		return mapper.selectCountbyHospital(addr, title);
	}

	@Override
	public List<Hospital> selectHospital(String addr, String title) {
		StringBuilder str1 = new StringBuilder();
		str1.append("%");
		str1.append(addr);
		str1.append("%");
		StringBuilder str2 = new StringBuilder();
		str2.append("%");
		str2.append(title);
		str2.append("%");
		
		addr = str1.toString();
		title = str2.toString();
		
		
		return mapper.selectHospital(addr, title);
	}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		// 저장 경로의 폴더 생성부
				File folder = new File(savePath);

				if (folder.exists() == false) {
					folder.mkdirs();
				}

				System.out.println("savePath : " + savePath);

				String originalFileName = upfile.getOriginalFilename();
				String reNameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
						+ originalFileName.substring(originalFileName.lastIndexOf("."));
				String reNamePath = savePath + "/" + reNameFileName;

				// 업로드 된 파일 이름을 바꾸고, 실제 디스크에 저장하는 코드부
				try {
					upfile.transferTo(new File(reNamePath));
				} catch (Exception e) {
					return null;
				}

				return reNameFileName;
	}

}
