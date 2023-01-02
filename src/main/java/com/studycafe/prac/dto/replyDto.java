package com.studycafe.prac.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class replyDto {
	
	private int rnum;
	private String rcontent;
	private String rid;
	private int rorinum;//댓글이 달린 원글의 게시판번호
	private String rdate;
}
