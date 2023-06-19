package com.festicket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;
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
	
	@RequestMapping(value = "/loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkIdPwFlag = dao.checkIdPwDao(userId,userPassword);
		// 1이면 로그인 성공, 0이면 로그인 실패
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if(checkIdPwFlag == 1) { // 로그인 성공 실행
			session.setAttribute("sessionId", userId);			
			model.addAttribute("memberDto", dao.getMemberInfo(userId));
		}
		
		return "loginOk";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		
	    HttpSession session = request.getSession();
	    session.invalidate();
	    
	    return "logout";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		return "join";
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
		
		int checkId = dao.checkIdDao(userId); // 가입하려는 id 존재여부 체크 1이면 이미 존재
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
	
	 @RequestMapping(value = "/findId") // 아이디 찾기
		public String findId() {
		 
			return "findId";
		}
	
	 @RequestMapping(value = "/findId_result") // 아이디 찾기
		public String findId_result(HttpServletRequest request, Model model) {
			
		 IDao dao = sqlSession.getMapper(IDao.class);
		 
		 String name = request.getParameter("name");
		 String userPhone = request.getParameter("userPhone");

		 String findId = dao.findId_result(name, userPhone);
		 model.addAttribute("findId", findId);

		 return "findId_result";
		}
	 
	 
	 @RequestMapping(value = "/findPw") // 비밀번호 찾기
		public String findPw() {
			return "findPw";
		}
	 
	 @RequestMapping(value = "/findPw_result") // 비밀번호 찾기
	 public String findPw_result(HttpServletRequest request, Model model) {
			
		 IDao dao = sqlSession.getMapper(IDao.class);
		 
		 String userId = request.getParameter("userId");
		 String email = request.getParameter("email");
		 String userPhone = request.getParameter("userPhone");

		 String findPw = dao.findPw_result(userId, email, userPhone);
		 model.addAttribute("findPw", findPw);

		 return "findPw_result";
		}
	
	@RequestMapping(value = "/searchResult")
	public String searchResult(HttpServletRequest request, Model model, Criteria criteria, HttpSession session) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		// 페이징
		int pageNum = 0;
		
		// 처음에는 request 객체에 넘어오는 값이 없기 떄문에 null 값이 옴
		if(request.getParameter("pageNum") == null) {
			pageNum = 1;
			criteria.setPageNum(pageNum);
		} else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			criteria.setPageNum(pageNum);
		}
		
		String keyword = request.getParameter("keyword");
		
		int totalResult = dao.totalSearchResultCount(keyword); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalResult);
		
		List<EventDto> searchListDtos = dao.getSearchResult(keyword, criteria.getCountList(), pageNum);
		
		request.setAttribute("search_word", keyword);
		request.setAttribute("totalCount", totalResult);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("searchListDtos", searchListDtos);
		model.addAttribute("currPage", pageNum);
		
		return "searchResult";
	}
	
	@RequestMapping(value = "/searchOrderBy")
	public String searchOrderBy(HttpServletRequest request, Model model, Criteria criteria, HttpSession session) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		// 페이징
		int pageNum = 0;
		
		// 처음에는 request 객체에 넘어오는 값이 없기 떄문에 null 값이 옴
		if(request.getParameter("pageNum") == null) {
			pageNum = 1;
			criteria.setPageNum(pageNum);
		} else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			criteria.setPageNum(pageNum);
		}
		
		String keyword = request.getParameter("keyword");
		
		int totalResult = dao.totalSearchResultCount(keyword); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalResult);
		String orderOption = request.getParameter("orderOption");
		
		List<EventDto> searchListDtos = new ArrayList<>();
		
		if(orderOption.equals("startRecent")) {
			searchListDtos = dao.searchOrderByStartRecent(keyword, criteria.getCountList(), pageNum);
		}
		else if(orderOption.equals("startLate")) {
			searchListDtos = dao.searchOrderByStartLate(keyword, criteria.getCountList(), pageNum);
		} 
		else if(orderOption.equals("endRecent")) {
			searchListDtos = dao.searchOrderByEndRecent(keyword, criteria.getCountList(), pageNum);
		}
		else {
			searchListDtos = dao.searchOrderByEndLate(keyword, criteria.getCountList(), pageNum);
		}
		
		request.setAttribute("search_word", keyword);
		request.setAttribute("totalCount", totalResult);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("searchListDtos", searchListDtos);
		model.addAttribute("currPage", pageNum);
		
		return "searchOrderBy";
	}
	
}