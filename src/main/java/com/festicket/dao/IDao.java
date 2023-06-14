package com.festicket.dao;

import java.util.Date;

import com.festicket.dto.MemberDto;

public interface IDao {
		
	//회원가입
	public int checkIdDao(String userId); //가입하려는 id의 존재여부 체크
	public int checkEmailDao(String email); //가입하려는 id의 존재여부 체크
//	public int joinDao(String userId, String userPassword, String userPhone, String email, String name, Date today);
	public int joinDao(String userId, String userPassword, String userPhone, String email, String name, Date signupDate); //회원가입
	
	
	//로그인
	public int checkIdPwDao(String userId, String userPassword); //아이디와 비밀번호의 일치여부 체크
	public MemberDto getMemberInfo(String userId);


	
	
	

	
	
	
}