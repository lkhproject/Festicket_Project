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
	
	@RequestMapping(value = "/searchResult")
	public String searchResult(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		request.setAttribute("search_word", keyword);
		
		int totalResult = dao.totalSearchResultCount(keyword); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalResult);
		
		List<EventDto> searchListDtos = dao.getSearchResult(keyword, criteria.getCountList(), pageNum);
		
		model.addAttribute("totalCount", totalResult);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("searchListDtos", searchListDtos);
		model.addAttribute("currPage", pageNum);
		
		return "searchResult";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		return "join";
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
			//session.setAttribute("sessionId", userId);			
			
			model.addAttribute("memberDto", dao.getMemberInfo(userId));
		}
		
		return "loginOk";
	}
	
	

// *************************************************CS
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
	public String csBoardView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csHitDao(request.getParameter("c_idx")); // 조회수 증가
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("c_idx")));
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("c_idx")));
		
		return "csBoardView";
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
		
		return "csBoardModify";
	}
	
	@RequestMapping(value = "csModifyOk")
	public String csModifyOk(HttpServletRequest request, Model model) {
		
		String c_idx = request.getParameter("c_idx");
		String c_title = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csModifyDao(c_idx, c_title, c_content);
		
		model.addAttribute("csBoardDto", dao.csViewDao(c_idx)); // 수정이 된 후 글내용
		
		return "csModifyOk";
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
		return "csBoardSearch";
	}
	// *************************************************CS
	
	
	
}
