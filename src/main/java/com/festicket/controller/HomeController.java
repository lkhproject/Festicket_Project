package com.festicket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	public String index() {

		
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
	
	@RequestMapping(value = "/myPageUnreg")
	public String myPageUnreg() {
		
		return "myPageUnreg";
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
	public String joinOk(HttpServletRequest request, Model model) throws ParseException {
		
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String userPhone = request.getParameter("userPhone");

		IDao dao = sqlSession.getMapper(IDao.class);
	
		int joinCheck = 0;
		
		int checkId = dao.checkIdDao(userId);//가입하려는 id 존재여부 체크 1이면 이미 존재
		int checkEmail = dao.checkEmailDao(email);
		
		if(checkId == 0 && checkEmail == 0) {
			Date now = new Date();
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        String strToday = formatter.format(now);
	        Date today = formatter.parse(strToday);
	        
			joinCheck = dao.joinDao(userId, userPassword, userPhone, email, name, today);
			model.addAttribute("checkId", checkId);
			model.addAttribute("checkEmail", checkEmail);
		//joinCheck 값이 1이면 회원가입 성공, 아니면 가입실패
		} else {
			model.addAttribute("checkId", checkId);
			model.addAttribute("checkEmail", checkEmail);
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
	
	@RequestMapping(value = "/loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkIdPwFlag = dao.checkIdPwDao(userId,userPassword);
		//1이면 로그인 성공, 0이면 로그인 실패
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if(checkIdPwFlag == 1) {//로그인 성공 실행
			session.setAttribute("sessionId", userId);			
			
			model.addAttribute("memberDto", dao.getMemberInfo(userId));
		}
		
		return "loginOk";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
	    // 세션 객체 가져오기
	    HttpSession session = request.getSession();
	    
	    // 세션 무효화 (세션 제거)
	    session.invalidate();
	    
	    // 로그아웃 후 리다이렉트할 경로를 리턴합니다.
	    return "logout";
	
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
	@RequestMapping(value = "/adminEventAdd")
	public String adminEventAdd() {
		
		return "adminEventAdd";
	}
	
	
}