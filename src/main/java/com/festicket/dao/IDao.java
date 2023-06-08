package com.festicket.dao;

import java.util.List;

import com.festicket.dto.CSanswerDto;
import com.festicket.dto.CSboardDto;
import com.festicket.dto.EventDto;
import com.festicket.dto.QABoardDto;
import com.festicket.dto.ReviewDto;

public interface IDao {
//	public List<EventDto> eventListDao(int amount, int pageNum); // 행사 리스트 + 페이징
//	public EventDto contentViewDao(String eventNum); // 리스트에서 선택한 특정 글 가져오기
//	public void deleteDao(String eventNum); // 글 지우기
	
	// 검색
	public List<EventDto> getSearchResult(String keyword, int countList, int countPage); // 검색 결과 가져오기
	public int totalSearchResultCount(String keyword); // 검색 결과 개수
	
	// 랭킹
	public List<EventDto> eventListDao(int countList, int countPage); // 모든 행사 리스트
	public int totalEventCountDao(); // 행사의 총 개수
	public List<EventDto> getTopFiveEventsDao(); // 행사 탑5 리스트 
	public List<EventDto> getOngoingEventDao(); // 진행중인 행사 리스트
	
	// 행사 선택
	public EventDto getEventDao(int eventNum); // 행사 하나만 가져오기
	
	// 페스티벌
	public List<EventDto> festivalListDao(int countList, int countPage); // 페스티벌 리스트
	public int totalFestivalCountDao();
	public List<EventDto> top5FestivalListDao(); // 페스티벌 탑5 리스트
	
	// 전시
	public List<EventDto> exhibitionListDao(int countList, int countPage); // 전시 리스트
	public int totalExhibitionCountDao();
	public List<EventDto> top5ExhibitionListDao(); // 전시 탑5 리스트
	
	// 리뷰
	public List<ReviewDto> getReviewListDao(int eventNum); // 리뷰 글 리스트 가져오기
	
	// QA
	public List<QABoardDto> getQAListDao(int eventNum); // QA 글 리스트 가져오기
	
	// 고객센터 게시판 기능
	public List<CSboardDto> csListDao(int countList, int countPage); // 게시글 목록 모두 가져오기
	public void csWriteDao(String c_userId, String c_title, String c_content); // 게시글 쓰기
	public CSboardDto csViewDao(String c_idx); // 게시판 리스트에서 선택한 특정 글 가져오기
	public void csDeleteDao(String c_idx); // 게시글 삭제
	public void csHitDao(String c_idx); // 조회수 증가
	public int totalCSListCountDao(); // 총 게시글 개수 반환
	
	// 댓글 기능
	public int replyWriteDao(String ca_content, String ca_boardNum); // 댓글 입력
	public void replyCountDao(String ca_boardNum); // 댓글이 달린 원글의 댓글 필드 값 +1
	public List<CSanswerDto> replyListDao(String ca_boardNum); // 해당 원글에 달린 댓글의 리스트 가져오기
	public void replyDeleteDao(String ca_idx); // 댓글 삭제
	public void replyCountMinusDao(String ca_boardNum); // 댓글이 달린 원글의 댓글 필드 값 -1
	public void boardReplyDeleteDao(String ca_boardNum); // 삭제한 게시글 댓글 모두 삭제
	
}

