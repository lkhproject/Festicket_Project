package com.festicket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;
import com.festicket.dto.CSboardDto;
import com.festicket.dto.Criteria;
import com.festicket.dto.EventDto;
import com.festicket.dto.PageDto;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/index")
	public String index(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("festival_5", dao.top5FestivalListDao());
		model.addAttribute("exhibition_5", dao.top5ExhibitionListDao());
		
		return "index";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "/myPage")
	public String myPage() {
		return "myPage";
	}
	
	@RequestMapping(value = "/ranking")
	public String ranking() {
		return "ranking";
	}
	
	@RequestMapping(value = "/reservation")
	public String reservation(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("event", dao.eventListDao(0, 0));
		model.addAttribute("totalCount", dao.totalEventCountDao());
		
		return "reservation";
	}
	
	@RequestMapping(value = "/rvView")
	public String rvView(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
		
		model.addAttribute("event", dao.getEventDao(eventNum));
		model.addAttribute("reviewList", dao.getReviewListDao(eventNum));
		model.addAttribute("QA_List", dao.getQAListDao(eventNum));
		
		return "rvView";
	}
	
}
