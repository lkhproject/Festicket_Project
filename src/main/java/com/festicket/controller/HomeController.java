package com.festicket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;
import com.festicket.dto.EventDto;

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
	
	@RequestMapping(value = "/join")
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/memberjoin")
	public String memberjoin() {
		
		return "memberjoin";
	}
	
	@RequestMapping(value = "/myPage")
	public String myPage() {
		
		return "myPage";
	}
	
	@RequestMapping(value = "/myPageModify")
	public String myPageModify() {
		
		return "myPageModify";
	}

	@RequestMapping(value = "/joinOk")
	public String joinOk(HttpServletRequest request, Model model) {
		
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String userPhone = request.getParameter("userPhone");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		IDao dao = sqlSession.getMapper(IDao.class);
	
		int joinCheck = 0;
		
		int checkId = dao.checkIdDao(userId);//가입하려는 id 존재여부 체크 1이면 이미 존재
		
		if(checkId == 0) {
			joinCheck = dao.joinDao(userId, userPassword, userPhone, email,name);
			model.addAttribute("checkId", checkId);
		//joinCheck 값이 1이면 회원가입 성공, 아니면 가입실패
		} else {
			model.addAttribute("checkId", checkId);
		}
		
		if(joinCheck == 1) {
			model.addAttribute("joinFlag", joinCheck);
			model.addAttribute("memberName", name);
			model.addAttribute("memberId", userId);
		} else {//회원가입실패
			model.addAttribute("joinFlag", joinCheck);
		}
		
		return "joinOk";
	}
	
//	@RequestMapping(value = "/ranking")
//	public String ranking() {
//		
//		return "ranking";
//	}
//	
//	@RequestMapping(value = "/exhibition")
//	public String exhibition() {
//		
//		return "exhibition";
//	}
//	
//	@RequestMapping(value = "/festival")
//	public String festival() {
//		
//		return "festival";
//	}
//	
//	@RequestMapping(value = "/csBoardList")
//	public String csBoardList() {
//		
//		return "csBoardList";
//	}
//	
//	@RequestMapping(value = "/csBoardWrite")
//	public String csBoardWrite() {
//		
//		return "csBoardWrite";
//	}
//	
//	@RequestMapping(value = "/adminList")
//	public String adminList(HttpServletRequest request, Model model) {
//		
//		
//		return "adminList";
//	}
//	
//	@RequestMapping(value = "/adminAddEvent")
//	public String adminList(Model model, HttpSession session, HttpServletRequest request) {
//
//		return "adminAddEvent";
//	}
//	
//	@RequestMapping(value = "/adminModify")
//	public String adminModify(HttpSession session, Model model) {
//			
//		return "adminModify";
//	}
//	
//	@RequestMapping(value = "/adminEventAdd")
//	public String adminEventAdd() {
//		
//		return "adminEventAdd";
//	}
	
	
}