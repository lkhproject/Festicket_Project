package com.festicket.dao;

import java.util.List;

import com.festicket.dto.CSboardDto;
import com.festicket.dto.EventDto;

public interface IDao {
	
	// 이벤트 가져오기
	public List<EventDto> eventListDao(); // 모든 이벤트 리스트
	public int totalEventCountDao(); // 이벤트의 총 개수
	
	// 고객센터
	public List<CSboardDto> csListDao(int countList, int countPage); // 게시글 목록 모두 가져오기
	public void csWriteDao(String c_userId, String c_title, String c_content); // 게시판 글쓰기
	public CSboardDto csViewDao(String c_idx); // 게시판 리스트에서 선택한 특정 글 가져오기
	public void csDeleteDao(String c_idx); // 게시판 글삭제
	public int totalCSListCountDao(); // 총 게시글 개수 반환
	
}
