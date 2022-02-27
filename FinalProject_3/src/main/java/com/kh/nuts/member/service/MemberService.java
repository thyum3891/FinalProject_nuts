package com.kh.nuts.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nuts.member.vo.Member;

public interface MemberService {
	int saveMember(Member member);
	List<Member> selectMemberAll();
	Member selectMemberById(@Param("id")String id);
	int deleteMember(@Param("id")String id);
	boolean validateById(String userId);
	Member login(String id, String pwd);
	String saveFile(MultipartFile upfile, String savePath);
	int updateMember(Member member);
}
