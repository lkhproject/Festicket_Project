package com.festicket.dao;

import java.util.List;

import com.festicket.dto.EventDto;
import com.festicket.dto.MemberDto;

public interface IDao {
	
	// 페스티벌
	public List<EventDto> festivalListDao(int countList, int countPage); // 페스티벌 리스트
	public int totalFestivalCountDao();
	public List<EventDto> top5FestivalListDao(); // 페스티벌 탑5 리스트
	
	// 전시
	public List<EventDto> exhibitionListDao(int countList, int countPage); // 전시 리스트
	public int totalExhibitionCountDao();
	public List<EventDto> top5ExhibitionListDao(); // 전시 탑5 리스트
		
	//회원관리	
	public int joinDao(String userId, String userPassword, String userPhone, String email, String name); //회원가입
	public int checkIdDao(String userId); //가입하려는 id의 존재여부 체크
	public int checkIdPwDao(String userId, String userPassword);//아이디와 비밀번호의 일치여부 체크
	public MemberDto getMemberInfo(String userId);//아이디로 조회하여 회원 정보 모두 가져오기
	public int modifyMemberDao(String userId, String userPassword, String name, String email);//회원정보 수정

	
	
	
}