package com.festicket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDto {
	
	private int startPage;	// 현재 화면에서 보여질 시작 페이지 번호
	private int endPage;	// 현재 화면에서 보여질 마지막 페이지 번호
	private boolean prev;	// 더 이하 페이지가 있는지의 여부
	private boolean next;	// 더 이상 페이지가 있는지의 여부
	private int total;		// 전체 글의 수
	
	private Criteria criteria;
	
	public PageDto(Criteria criteria, int total) {
		
		this.criteria = criteria;
		this.total = total;
		
		this.endPage = (int) Math.ceil((criteria.getPageNum()/5.0)) * 5; // ceil -> 올림
		// 53개의 글이 존재
		//	    1 2 3 4 5 next
		// prev 6 7 8 9 10 next
		// prev 11
		this.startPage = this.endPage - 4;
		
		int realEndPage = (int) Math.ceil(total*1.0/criteria.getAmount());
		// 실제 끝 페이지 계산 (총 글의 수 / 한 페이지당 출력될 글의 수 -> 올림한 정수)
		// 글이 53개면 53/5 = 10.6 -> 올림 11로 변환한 값이 실제 끝 페이지수가 됨
		
		if(realEndPage < this.endPage ) {
			this.endPage = realEndPage;
		}
		// 처음 계산한 마지막 페이지의 값인 endPage 값보다 realEndPage 값이 작게 나오면
		// 그 값으로 대신해야 실제 마지막 페이지값이 마지막 페이지 번호로 출력됨
		
		this.prev = this.startPage > 1; // StartPage는 1 6 11 16 21...나가므로 1보다만 크면 prev가 존재해야함
		// 시작 페이지 번호가 5보다 크면 prev가 존재해야 함
		this.next = this.endPage < realEndPage;
		// 마지막 페이지 번호가 실제 페이지 번호보다 작은 경우에만 next가 존재해야 함
	}
	
}
