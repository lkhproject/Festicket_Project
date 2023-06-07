package com.festicket.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
	
	private int rw_idx; // 리뷰글번호
	private String rw_userId; // 리뷰 아이디
	private int rw_eventNum; // 원글 행사 번호
	private int rw_rating; // 평점
	private String rw_content; // 리뷰내용
	private Date rw_date; // 리뷰쓴날
	
}
