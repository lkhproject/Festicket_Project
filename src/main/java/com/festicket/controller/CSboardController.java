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
import com.festicket.dto.MemberDto;
import com.festicket.dto.PageDto;

@Controller
public class CSboardController {

	@Autowired
	private SqlSession sqlSession;
	
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
		
		int totalCount = dao.csListTotalCountDao(); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalCount);	
		
		List<CSboardDto> CSboardDtos = dao.csListDao(criteria.getCountList(), pageNum);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("csBoardDtos", CSboardDtos);
		model.addAttribute("currPage", pageNum);
		
		return "CS/csBoardList";
	}
	
	@RequestMapping(value = "/csBoardWrite")
	public String csBoardWrite(HttpServletRequest request, Model model, HttpSession session) {
		
		String sessionId = (String)session.getAttribute("sessionId");

		int loginOk = 0;
		
		if(sessionId != null && !sessionId.isEmpty()) {
			loginOk = 1;
		}
		
		request.setAttribute("loginOk", loginOk);
		
		return "CS/csBoardWrite";
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
	public String csBoardView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csHitDao(request.getParameter("c_idx")); // 조회수 증가
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("c_idx")));
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("c_idx")));
		
		return "CS/csBoardView";
	}
	
	@RequestMapping(value = "/csBoardModify")
	public String csBoardModify(HttpServletRequest request, HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("c_idx")));
		
//		String sessionId = (String) session.getAttribute("sessionId");
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		model.addAttribute("csBoardDto", dao.csViewDao(sessionId));
		
		return "CS/csBoardModify";
	}
	
	@RequestMapping(value = "csModifyOk")
	public String csModifyOk(HttpServletRequest request, Model model) {
		
		String c_idx = request.getParameter("c_idx");
		String c_title = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csModifyDao(c_idx, c_title, c_content);
		
		model.addAttribute("csBoardDto", dao.csViewDao(c_idx)); // 수정이 된 후 글내용
		
		return "CS/csModifyOk";
	}
	
	@RequestMapping(value = "/csBoardDelete")
	public String csBoardDelete(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csDeleteDao(request.getParameter("c_idx"));	
		dao.boardReplyDeleteDao(request.getParameter("ca_boardNum"));
		
		return "redirect:csBoardList";
	}
	
	@RequestMapping(value = "/csBoardSearch")
	public String search_list(HttpServletRequest request, Model model, Criteria criteria) {
		
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

		String searchOption = request.getParameter("searchOption");
		String keyword = request.getParameter("keyword");
		
		if(searchOption.equals("title")) {
			int totalCount = dao.totalcsSearch_TitleCount(keyword);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<CSboardDto> CSboardDtos = dao.csSearchTitleDao(keyword, criteria.getCountList(), pageNum);
			
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("CSboardDtos", CSboardDtos);
			model.addAttribute("currPage", pageNum);
		}
		else if(searchOption.equals("content")) {
			int totalCount = dao.totalcsSearch_ContentCount(keyword);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<CSboardDto> CSboardDtos = dao.csSearchContentDao(keyword, criteria.getCountList(), pageNum);
			
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("CSboardDtos", CSboardDtos);
			model.addAttribute("currPage", pageNum);
		} else {
			int totalCount = dao.totalcsSearch_IdCount(keyword);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<CSboardDto> CSboardDtos = dao.csSearchWriterDao(keyword, criteria.getCountList(), pageNum);
			
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("CSboardDtos", CSboardDtos);
			model.addAttribute("currPage", pageNum);
		}
		return "CS/csBoardSearch";
	}
}
