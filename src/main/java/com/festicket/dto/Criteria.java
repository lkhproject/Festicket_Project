package com.festicket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	
	private int pageNum = 1; // 현재 페이지 번호(글 리스트 화면에서 무조건 1페이지가 보여져야 하므로 초기값은 1)
	private int countList = 6; // 한 페이지 당 출력 될 글의 수
	private int countPage = 5; // 한 화면에 출력될 페이지 수
	private int startNum; // 현재 선택된 페이지에서 시작할 글의 번호
	
}
