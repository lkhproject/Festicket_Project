package com.festicket.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QAanswerDto {

	private int qa_idx;
	private String qa_userId;
	private int qa_boardNum;
	private String qa_content;
	private Date qa_answerDate;
	private Date qa_modifyDate;
	
}
