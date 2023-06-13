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
	
	@RequestMapping(value = "/exhibition")
	public String exhibition() {
		return "exhibition";
	}
	
	@RequestMapping(value = "/festival")
	public String festival() {
		return "festival";
	}
	
	@RequestMapping(value = "/adminList")
	public String adminList(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		int totalCount = dao.totalEventCountDao();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> eventListDtos = dao.eventListDao(criteria.getCountList(), pageNum);
		
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("eventListDtos", eventListDtos);
		model.addAttribute("currPage", pageNum);
		
		return "adminList";
	}
	
}
