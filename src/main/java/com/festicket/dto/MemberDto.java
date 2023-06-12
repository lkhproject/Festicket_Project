package com.festicket.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	
	private String userId; // 멤버아이디
	private String userPassword; // 멤버비밀번호
	private String userPhone; // 멤버전화
	private String email; // 멤버이메일
	private String name; // 멤버이름
	private Date signupDate; // 가입일
	   
	
}