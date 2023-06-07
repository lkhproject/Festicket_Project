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
import com.festicket.dto.PageDto;

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
		
//		EventDto eventDto = dao.contentViewDao(request.getParameter("eventNum"));
//		
//		if(sessionId != null) {
//			model.addAttribute("eventDto", eventDto);
//		}
		
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
	
	@RequestMapping(value = "/csBoardList")
	public String csBoardList(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		int totalCount = dao.totalCSListCountDao(); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalCount);	
		
		List<CSboardDto> CSboardDtos = dao.csListDao(criteria.getCountList(), pageNum);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("CSboardDtos", CSboardDtos);
		model.addAttribute("currPage", pageNum);
		
		return "csBoardList";
	}
	
	@RequestMapping(value = "/csBoardWrite")
	public String csBoardWrite() {
		return "csBoardWrite";
	}
	
	@RequestMapping(value = "/csBoardWriteOk")
	public String csBoardWriteOk(HttpServletRequest request) {
		
		String c_userId = request.getParameter("c_userId");
		String c_title = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csWriteDao(c_userId, c_title, c_content);
		
		return "redirect:csBoardList";
	}
	
	@RequestMapping(value = "/csBoardView")
	public String contentView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		CSboardDto csBoardDto = dao.csViewDao(request.getParameter("c_idx"));
		
		model.addAttribute("csBoardDto", csBoardDto);
		
		return "csBoardView";
	}
	
}
