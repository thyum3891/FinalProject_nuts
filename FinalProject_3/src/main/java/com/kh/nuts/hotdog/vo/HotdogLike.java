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
	String hl_id;
	String member_id;
	String hot_no;
}
