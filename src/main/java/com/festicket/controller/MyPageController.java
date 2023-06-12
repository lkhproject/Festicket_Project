package com.festicket.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;

@Controller
public class MyPageController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/myPageReview")
	public String myPageReview() {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		return "myPageReview";
	}

}
