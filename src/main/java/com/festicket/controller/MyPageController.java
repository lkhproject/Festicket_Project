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
import com.festicket.dto.Criteria;
import com.festicket.dto.PageDto;
import com.festicket.dto.ReserveDto;

@Controller
public class MyPageController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/myPage") // 예매내역으로 바로 이동
	public String myPage(HttpServletRequest request, Model model, HttpSession session, Criteria criteria) {
		
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
		return "myPage";
	}
	
	@RequestMapping(value = "/detailedRev") // 예매내역으로 바로 이동
	public String detailedRev(HttpServletRequest request, Model model, HttpSession session, Criteria criteria) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int reservedNum = Integer.parseInt(request.getParameter("selectedRev"));
		
		ReserveDto reserved = dao.getReservationDao(reservedNum, sessionId);
		
		model.addAttribute("details", reserved);
		
		return "detailedRev";
	}
	
}