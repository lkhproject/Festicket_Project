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
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
//		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		
		model.addAttribute("event", dao.getEventDao(eventNum));
		model.addAttribute("reviewList", dao.getReviewListDao(eventNum));
		model.addAttribute("QA_List", dao.getQAListDao(eventNum));
		
//		int eventLiked = dao.eventLiker(eventNum, "userId");
//		int reviewLiked = dao.reviewLiker(reviewNum, "userId");
//		
//		if(eventLiked == 0) {
//			dao.cancelReviewLiker(reviewNum, "userId");
//		}
//		if(reviewLiked == 0) {
//			dao.cancelEventLiker(eventNum, "userId");
//		}
		
		return "rvView";
	}
	
	@RequestMapping(value = "/confirmRev")
	public String confirmRev(HttpSession session, Model model, HttpServletRequest request) throws ParseException {

		IDao dao = sqlSession.getMapper(IDao.class);
		
//		String re_userId = request.getParameter("mid");
		String re_userId = "happyCat";
		int re_eventNum = Integer.parseInt(request.getParameter("selectedEventNum"));
		String re_price = request.getParameter("eventPrice");
		
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strToday = formatter.format(now);
        Date today = formatter.parse(strToday);
		
//		int re_ticketCount = Integer.parseInt(request.getParameter("selectedTicketCount"));
		int re_ticketCount = 2;
        
        String selectedDate = request.getParameter("selectedDate");
		Date re_ticketDate = formatter.parse(selectedDate);
		
		System.out.println(re_ticketCount);
		
		int revCheck = 0;
		
		revCheck = dao.reservationConfirmedDao(re_userId, re_eventNum, re_price, today, re_ticketCount, re_ticketDate);
		
//		같은 아이디로 같은 행사 예약하면 이미 예약한 행사가 있다고 티켓 매수 수정하라는 알림창 띄우기
		if(revCheck == 1) { // 예약완료
			model.addAttribute("comfirmedRev", dao.getReservationDao(re_eventNum, re_userId));
			model.addAttribute("event", dao.getEventDao(re_eventNum));
			model.addAttribute("revCheck", revCheck);
		} else { // 예약실패
			model.addAttribute("revCheck", revCheck);
		}
		
		return "confirmRev";
	}
	
	
}
