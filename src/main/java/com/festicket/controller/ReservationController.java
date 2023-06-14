package com.festicket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;

@Controller
public class ReservationController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/reservation")
	public String reservation(HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("event", dao.eventAllListDao());
		
		return "reservation";
	}
	
	@RequestMapping(value = "/rvView")
	public String rvView(HttpSession session, Model model, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int loginOk = 0;
		
		if(sessionId != null && !sessionId.isEmpty()) {
			loginOk = 1;
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
		session.setAttribute("eventNum", eventNum);
		
		request.setAttribute("loginOk", loginOk);
		model.addAttribute("event", dao.getEventDao(eventNum));
		model.addAttribute("reviewList", dao.getReviewListDao(eventNum));
		model.addAttribute("QA_List", dao.getQAListDao(eventNum));
		
		return "rvView";
	}
	
	@RequestMapping(value = "/confirmRev")
	public String confirmRev(HttpSession session, Model model, HttpServletRequest request) throws ParseException {

		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int re_eventNum = Integer.parseInt(request.getParameter("selectedEventNum"));
		String re_price = request.getParameter("eventPrice");
		
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strToday = formatter.format(now);
        Date today = formatter.parse(strToday);
		
		int re_ticketCount = Integer.parseInt(request.getParameter("ticketCount"));
        
        String selectedDate = request.getParameter("selectedDate");
		Date re_ticketDate = formatter.parse(selectedDate);
		
		int revCheck = 0;
		int noTicket = 0;
		int lessTicket = 0;
		
		int ticketLeft = dao.getTotalTicketDao(re_eventNum);
		
//		총 티켓 개수보다 많이 예약 or 남은 티켓이 없다면 돌려보내기
		if(ticketLeft >= re_ticketCount) {
			revCheck = dao.reservationConfirmedDao(sessionId, re_eventNum, re_price, today, re_ticketCount, re_ticketDate);
			noTicket = 1;
			lessTicket = 1;
		} else if(ticketLeft == 0) {
			revCheck = 2;
			noTicket = 0;
			lessTicket = 1;
		} else if(ticketLeft < re_ticketCount) {
			revCheck = 2;
			noTicket = 1;
			lessTicket = 0;
		}
		
		if(revCheck == 1) { // 예약완료
			
			model.addAttribute("comfirmedRev", dao.getReservationByRecentDao(re_eventNum, sessionId));
			
			// 총 티켓 매수 감소
			dao.ticketReservedDao(re_eventNum, re_ticketCount);
			
			model.addAttribute("noTicket", noTicket);
			model.addAttribute("lessTicket", lessTicket);
			model.addAttribute("left_t", ticketLeft);
			model.addAttribute("revCheck", revCheck);
		} else { // 예약실패
			model.addAttribute("noTicket", noTicket);
			model.addAttribute("lessTicket", lessTicket);
			model.addAttribute("left_t", ticketLeft);
			model.addAttribute("revCheck", revCheck);
		}
		
		return "confirmRev";
	}

	
}
