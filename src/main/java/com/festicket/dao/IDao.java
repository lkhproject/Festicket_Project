package com.festicket.dao;

import java.util.List;

import com.festicket.dto.CSanswerDto;
import com.festicket.dto.CSboardDto;
import com.festicket.dto.EventDto;

public interface IDao {
	
	// 이벤트 가져오기
	public List<EventDto> eventListDao(); // 모든 이벤트 리스트
	public int totalEventCountDao(); // 이벤트의 총 개수
	
	// 고객센터 게시판 기능
	public List<CSboardDto> csListDao(int countList, int countPage); // 게시글 목록 모두 가져오기
	public void csWriteDao(String c_userId, String c_title, String c_content); // 게시글 쓰기
	public CSboardDto csViewDao(String c_idx); // 클릭한 게시글 내용 보기
	public void csModifyDao(String c_idx, String c_userId, String c_title, String c_content); // 게시글 수정
	public void csDeleteDao(String c_idx); // 게시글 삭제
	public void csHitDao(String c_idx); // 조회수 증가
	public int csListTotalCountDao(); // 총 게시글 개수 반환
	
	// 고객센터 검색 기능
	public int totalcsSearch_TitleCount(String keyword); // 타이틀로 CS 검색결과
	public int totalcsSearch_IdCount(String keyword); // 아이디로 CS 검색결과
	public int totalcsSearch_ContentCount(String keyword); // 내용으로 CS 검색결과
	public List<CSboardDto> csSearchTitleDao(String keyword, int countList, int countPage); // 제목으로 검색
	public List<CSboardDto> csSearchContentDao(String keyword, int countList, int countPage); // 내용으로 검색
	public List<CSboardDto> csSearchWriterDao(String keyword, int countList, int countPage); // 아이디로 검색
	
	// 댓글 기능
	public int replyWriteDao(String ca_content, String ca_boardNum); // 댓글 입력
	public void replyCountDao(String ca_boardNum); // 댓글이 달린 원글의 댓글 필드 값 +1
	public List<CSanswerDto> replyListDao(String ca_boardNum); // 해당 원글에 달린 댓글의 리스트 가져오기
	public void replyDeleteDao(String ca_idx); // 댓글 삭제
	public void replyCountMinusDao(String ca_boardNum); // 댓글이 달린 원글의 댓글 필드 값 -1
	public void boardReplyDeleteDao(String ca_boardNum); // 삭제한 게시글 댓글 모두 삭제
	
}
