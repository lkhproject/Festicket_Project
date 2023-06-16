package com.festicket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;
import com.festicket.dto.Criteria;
import com.festicket.dto.PageDto;
import com.festicket.dto.ReserveDto;

@Controller
public class ReviewController {
	
	private SqlSession sqlSession;

	@RequestMapping(value = "/myPageReview") // 후기 리스트
	public String myPageReview(HttpServletRequest request, Model model, HttpSession session, Criteria criteria) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int loginOk = 0;
		
		// 세션 아이디가 없다면 접근불가
		if(sessionId == null || sessionId.isEmpty()) {
			request.setAttribute("loginOk", loginOk);
		} else {
			loginOk = 1;
			
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
			
			int totalCount = dao.getReservationCountDao(sessionId);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<ReserveDto> revListDtos = dao.getReservationListDao(sessionId ,criteria.getCountList(), pageNum);
			
			request.setAttribute("loginOk", loginOk);
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("revListDtos", revListDtos);
			model.addAttribute("currPage", pageNum);
			}
			return "myPage/myPageReview";
	}
	
	@RequestMapping(value = "/reviewWrite") // 후기 작성
	public String reviewWrite(HttpServletRequest request, HttpSession session, Model model) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int loginOk = 0;
		
		// 세션 아이디가 없다면 접근불가
		if(sessionId == null || sessionId.isEmpty()) {
			request.setAttribute("loginOk", loginOk);
		} else {
			loginOk = 1;
		}
		return "myPage/reviewWrite";
	}
	
    @RequestMapping(value = "/reviewWriteOk")
    public String reviewWriteOk(HttpServletRequest request) {
      
    	String rw_userId = request.getParameter("rw_userId");
    	String rw_eventNum = request.getParameter("rw_eventNum");
	    String rw_rating = request.getParameter("rw_rating");
	    String rw_content = request.getParameter("rw_content");
	      
	    IDao dao = sqlSession.getMapper(IDao.class);
	      
	    dao.reviewWriteDao(rw_userId, rw_eventNum, rw_rating, rw_content);
	    
	    return "redirect:myPageReview";
	}
}
