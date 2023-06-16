package com.festicket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventReviewLikeDto {

	private int reviewIdx; // 리뷰 번호
	private String reviewLikerId;
	
}