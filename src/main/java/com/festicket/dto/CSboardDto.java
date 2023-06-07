package com.festicket.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CSboardDto {

	private int c_idx; // 게시판글번호
	private String c_userId; // 글쓴이아이디
	private String c_title; // 글제목
	private String c_content; // 글내용
	private Date c_writeDate; // 글쓴날
	private Date c_modifyDate; // 글수정날
	private int c_hit; // 조회수
	private int c_replyCount; // 댓글개수
}
