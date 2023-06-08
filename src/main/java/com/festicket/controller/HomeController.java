package com.festicket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/index")
	public String index(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("event", dao.eventListDao());
		
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
		
		model.addAttribute("event", dao.eventListDao());
		
		return "reservation";
	}
	
	@RequestMapping(value = "/rvView")
	public String rvView() {
		return "rvView";
	}
	
	@RequestMapping(value = "/exhibition")
	public String exhibition() {
		return "exhibition";
	}
	
	@RequestMapping(value = "/festival")
	public String festival() {
		return "festival";
	}
	
	@RequestMapping(value = "/adminList")
	public String adminList(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("event", dao.eventListDao());
		
		return "adminList";
	}
	
	@RequestMapping(value = "/adminAddEvent")
	public String adminList(Model model, HttpSession session, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		return "adminAddEvent";
	}
	
	@RequestMapping(value = "/adminModify")
	public String adminModify(HttpSession session, Model model) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		return "adminModify";
	}
	
	@RequestMapping(value = "/adminEventAdd")
	public String adminEventAdd() {
		return "adminEventAdd";
	}
	
}
