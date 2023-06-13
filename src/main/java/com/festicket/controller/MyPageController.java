package com.festicket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/myPage") // 예매내역으로 바로 이동
	public String myPage(HttpServletRequest request, Model model, HttpSession session) {
		
		
		
		return "myPage";
	}
	
	
}
