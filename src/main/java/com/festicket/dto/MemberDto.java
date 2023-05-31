package com.festicket.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	
	private String userId;
	private String userPassword;
	private String userPhone;
	private String email;
	private String name;
	private String signupDate;
	
}
