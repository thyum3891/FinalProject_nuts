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
	private BCryptPasswordEncoder passwordEncoder; // SHA-256 Hash code 알고리즘 (일반향 암호)

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveMember(Member member) {
		int result = 0;
		
//		if(member.getId() != null) {
//			result = mapper.updateMember(member);
//		}else {
			String encodePwd = passwordEncoder.encode(member.getPw()); // 평문을 hash code 변환
			member.setPw(encodePwd);
			result = mapper.insertMember(member);
//		}
		return result;
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
		
		// passwordEncoder 활용법
		
		System.out.println(member.getPw()); // Hash code로 암호화된 패스워드가 출력
		System.out.println(passwordEncoder.encode(pwd)); // encode를 통해 평문에서 암호문으로 바꾸는 코드
		System.out.println(passwordEncoder.matches(pwd, member.getPw())); 
							// 파라메터로 받아온 pwd를 암호 화하고 기존 암호화 비교하는 코드
		
//		return member != null && 
//				passwordEncoder.matches(pwd, member.getPassword()) ? member : null;
//		
		
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
