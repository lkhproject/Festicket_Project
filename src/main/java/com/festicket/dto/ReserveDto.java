package com.festicket.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReserveDto {
	
	private int re_idx;
	private String re_userId;
	private int re_eventNum;
	private String re_price;
	private Date re_date;
	private int re_ticketCount;
	private Date re_ticketDate;
	private int re_written;
	
//	event 테이블
	private String title;
	private String main_img;
	private String gunName;
	private String place;
	
}