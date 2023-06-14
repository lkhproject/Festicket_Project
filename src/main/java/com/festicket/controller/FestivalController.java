package com.festicket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
public class FestivalController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/festival")
	public String festival(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		int totalCount = dao.totalFestivalCountDao();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> festivalDtos = dao.festivalListDao(criteria.getCountList(), pageNum);
		
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("festivalDtos", festivalDtos);
		model.addAttribute("currPage", pageNum);
		
		return "festival/festival";
	}
	
	@RequestMapping(value = "/festivalOrderBy")
	public String festivalOrderBy(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		int totalCount = dao.totalFestivalCountDao();
		String orderOption = request.getParameter("orderOption");
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> festivalDtos = new ArrayList<>();
		
		System.out.println(orderOption);
		
		if(orderOption.equals("startRecent")) {
			festivalDtos = dao.festivalOrderByStartRecent(criteria.getCountList(), pageNum);
		}
		else if(orderOption.equals("startLate")) {
			festivalDtos = dao.festivalOrderByStartLate(criteria.getCountList(), pageNum);
		} 
		else if(orderOption.equals("endRecent")) {
			festivalDtos = dao.festivalOrderByEndRecent(criteria.getCountList(), pageNum);
		}
		else {
			festivalDtos = dao.festivalOrderByEndLate(criteria.getCountList(), pageNum);
		}
		
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("festivalDtos", festivalDtos);
		model.addAttribute("currPage", pageNum);
		
		
		return "festival/festivalOrderBy";
	}

}
