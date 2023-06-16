package com.festicket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventLikeDto {
	
	private int eventIdx; // 행사 번호
	private String eventLikerId;
	
}