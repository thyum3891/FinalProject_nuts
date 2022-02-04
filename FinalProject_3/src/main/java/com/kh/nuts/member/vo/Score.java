package com.kh.nuts.member.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Score {
	String score_id;
	String req_id;
	String recive_id;
	String score;

}
