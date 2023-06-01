package com.festicket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CSanswerDto {

	private int ca_idx; // 답변글번호
	private String ca_userId; // 답변아이디
	private String ca_content; // 답변내용
	private int ca_boardNum; // 게시판원글번호
	private String ca_answerDate; // 답변일
	private String ca_modifyDate; // 답변수정일
	
}