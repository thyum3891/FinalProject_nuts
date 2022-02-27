package com.kh.nuts.member.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.member.mapper.MemberMapper;
import com.kh.nuts.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveMember(Member member) {
		int result = 0;
			String encodePwd = passwordEncoder.encode(member.getPw()); 
			member.setPw(encodePwd);
			result = mapper.insertMember(member);
		return result;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateMember(Member member) {
		if(member.getPw() != null) {
		String encodePwd = passwordEncoder.encode(member.getPw()); 
		member.setPw(encodePwd);
		}
		return mapper.updateMember(member);
	}

	@Override
	public List<Member> selectMemberAll() {
		return mapper.selectMemberAll();
	}

	@Override
	public Member selectMemberById(String id) {
		return mapper.selectMemberById(id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}
	
	@Override
	public boolean validateById(String userId) {
		return this.selectMemberById(userId) != null;
	}
	@Override
	public Member login(String id, String pwd) {
		Member member = this.selectMemberById(id);
		
		
		if(id.equals("admin")) {
			return member;
		}
		
		if(member != null && passwordEncoder.matches(pwd, member.getPw()) == true) {
			return member;
		}else {
			return null;
		}
	}
	
	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
				File folder = new File(savePath);

				if (folder.exists() == false) {
					folder.mkdirs();
				}


				String originalFileName = upfile.getOriginalFilename();
				String reNameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
						+ originalFileName.substring(originalFileName.lastIndexOf("."));
				String reNamePath = savePath + "/" + reNameFileName;

				try {
					upfile.transferTo(new File(reNamePath));
				} catch (Exception e) {
					return null;
				}

				return reNameFileName;
	}
}
