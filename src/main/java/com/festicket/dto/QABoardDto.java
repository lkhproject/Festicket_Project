package com.festicket.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QABoardDto {
	
	private int q_idx;
	private int q_eventNum;
	private String q_userId;
	private String q_title;
	private String q_content;
	private Date q_writeDate;
	private Date q_modifyDate;
	private int q_hit;
	
}