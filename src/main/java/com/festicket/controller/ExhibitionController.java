package com.festicket.controller;

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
public class ExhibitionController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/exhibition")
	public String exhibition(HttpServletRequest request, Model model, Criteria criteria) {

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
		
		int totalCount = dao.totalExhibitionCountDao();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> exhibitionDtos = dao.exhibitionListDao(criteria.getCountList(), pageNum);
		
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("exhibitionDtos", exhibitionDtos);
		model.addAttribute("currPage", pageNum);
		
		return "exhibition";
	}
	
}