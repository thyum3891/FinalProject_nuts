package com.kh.nuts.hotdog.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class HotdogLike {
	String HL_LIKE;
	String MEMBER_ID;
	String HOT_NO;
}
