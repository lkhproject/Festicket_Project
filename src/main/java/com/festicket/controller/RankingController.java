package com.festicket.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;

@Controller
public class RankingController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/ranking")
	public String ranking(HttpServletRequest request, Model model) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("ongoing", dao.getOngoingEventDao());
		model.addAttribute("topfiveEvent", dao.getTopFiveEventsDao());
		
		return "ranking/ranking";
	}
	
}
