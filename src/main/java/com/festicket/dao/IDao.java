package com.festicket.dao;

import java.util.List;

import com.festicket.dto.EventDto;

public interface IDao {
//	public List<EventDto> eventListDao(int amount, int pageNum); // 행사 리스트 + 페이징
//	public EventDto contentViewDao(String eventNum); // 리스트에서 선택한 특정 글 가져오기
//	public void deleteDao(String eventNum); // 글 지우기
	
	// 검색
	public List<EventDto> getSearchResult(String keyword, int countList, int countPage); // 검색 결과 가져오기
	public int totalSearchResultCount(String keyword); // 검색 결과 개수
	
	// 행사 가져오기
	public List<EventDto> eventListDao(); // 모든 행사 리스트
	public int totalEventCountDao(); // 행사의 총 개수
	public List<EventDto> getTopFiveEventsDao(); // 행사 탑5 리스트 
//	public List<EventDto> getOngoingEventDao(); // 진행중인 행사 리스트
	
	// 페스티벌
	public List<EventDto> festivalListDao(int countList, int countPage); // 페스티벌 리스트
	public int totalFestivalCountDao();
	public List<EventDto> top5FestivalListDao(); // 페스티벌 탑5 리스트
	
	// 전시
	public List<EventDto> exhibitionListDao(int countList, int countPage); // 전시 리스트
	public int totalExhibitionCountDao();
	public List<EventDto> top5ExhibitionListDao(); // 전시 탑5 리스트
	
}

