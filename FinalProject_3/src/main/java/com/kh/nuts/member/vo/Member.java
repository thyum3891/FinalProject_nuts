package com.kh.nuts.member.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Member {
	String id;                    //아이디            
	String pw;                    //비밀번호           
	String open_profile_url;      //카카오톡 오픈 프로필 URL
	String nick_name;             //닉네임            
	String phone_num;             //번호             
	String dog_size;              //반려견 크기         
	String profile_ori_name;      //프로필사진_원본이름     
	String profile_re_name;       //프로필사진_수정이름     
                                                  
}
