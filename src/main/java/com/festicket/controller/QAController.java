package com.festicket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;
import com.festicket.dto.Criteria;
import com.festicket.dto.PageDto;

@Controller
public class QAController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/qaView")
	public String qaView(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int qaNum = Integer.parseInt(request.getParameter("selectedQA"));
		
		dao.qaHitDao(qaNum);
		
		model.addAttribute("qaDto", dao.getQaDao(qaNum));
		
		return "qaView";
	}
	
	@RequestMapping(value = "/qaBoardWrite")
	public String qaBoardWrite(HttpSession session, Model model, HttpServletRequest request) {
		
		String eventNum = request.getParameter("eventNum");
		request.setAttribute("eventNum", eventNum);
		
		return "qaBoardWrite";
	}
	
	@RequestMapping(value = "/qaBoardWriteOk")
	public String qaBoardWriteOk(HttpSession session, Model model, HttpServletRequest request) throws ParseException {
		
		int q_eventNum = Integer.parseInt(request.getParameter("eventNum"));
		// String q_userId = request.getParameter("q_userId");
		String q_userId = "happyCat22";
		String q_title = request.getParameter("q_title");
		String q_content = request.getParameter("q_content");
		
		System.out.println(q_eventNum);
		System.out.println(q_title);
		System.out.println(q_content);
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strToday = formatter.format(now);
        Date today = formatter.parse(strToday);

		dao.qaWriteDao(q_eventNum, q_userId, q_title, q_content, today, 0);
		
		session.setAttribute("eventNum", q_eventNum);
		
		return "redirect:qaBoardList";
	}
	
	@RequestMapping(value = "/qaBoardList")
	public String qaBoardList(HttpSession session, Model model, HttpServletRequest request, Criteria criteria) throws ParseException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int eventNum = (int) session.getAttribute("eventNum");
		
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
		
		int totalCount = dao.totalQAListCountDao(eventNum); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalCount);	
				
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("QAListDtos", dao.getQAListPagingDao(eventNum, criteria.getCountList(), pageNum));
		model.addAttribute("currPage", pageNum);
		request.setAttribute("event", dao.getEventDao(eventNum));
		
		return "qaBoardList";
	}
}
