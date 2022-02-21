package com.kh.nuts.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kh.nuts.member.vo.Member;

@Repository

public interface MemberMapper {
	int insertMember(Member member);
	List<Member> selectMemberAll();
	Member selectMemberById(@Param("id")String id);
	int deleteMember(@Param("id")String id);
}
