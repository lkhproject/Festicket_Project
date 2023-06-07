package com.festicket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDto {
	
	private int startPage; // 현재 화면에서 보여질 시작 페이지 번호
	private int endPage; // 현재 화면에서 보여질 마지막 페이지 번호
	private boolean prev; // 더 이하 페이지가 있는지의 여부
	private boolean next; // 더 이상 페이지가 있는지의 여부
	private int total; // 전체 글의 수
	
	private Criteria criteria;
	
	public PageDto(Criteria criteria, int total) {
		this.criteria = criteria;
		this.total = total;
		
		this.endPage = (int) (Math.ceil((criteria.getPageNum() / (criteria.getCountPage()*1.0))) * criteria.getCountPage()); // ceil->올림
		this.startPage = this.endPage - 4;
		
		// 실제 끝 페이지 계산(총 글의 수 / 한 페이지당 출력될 글의 수 = 올림한 정수)
		// ex. 글이 53개면 53/5=10.6 = 올림(11) -> 실제 끝 페이지 수
		int realEndPage = (int)Math.ceil(total*1.0 / criteria.getCountList());
		
		if(realEndPage < this.endPage) {
			this.endPage = realEndPage;
		} // 처음 계산한 마지막 페이지 값인 endPage 값 보다 realEndPage 값이 작게 나오면
		  // 그 값으로 대신해야 실제 마지막 페이지값이 마지막 페이지 번호로 출력 
		
		// 시작 페이지 번호가 1보다 크면 prev가 존재해야 함 startPage(1, 6, 11... 으로 증가하기 때문)
		this.prev = this.startPage > 1;
		// 마지막 페이지 번호가 실제 페이지 번호보다 작은 경우에만 next 존재해야 함
		this.next = this.endPage < realEndPage;
	}
	
}
