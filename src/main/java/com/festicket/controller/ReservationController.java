package com.festicket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.festicket.dao.IDao;
import com.festicket.dto.EventLikeDto;
import com.festicket.dto.EventReviewLikeDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ReservationController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/reservation")
	public String reservation(HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("event", dao.eventAllListDao());
		
		return "reservation/reservation";
	}
	
	@RequestMapping(value = "/rvView")
	public String rvView(HttpSession session, Model model, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
		
		session.setAttribute("eventNum", eventNum);
		
		model.addAttribute("event", dao.getEventDao(eventNum));
		model.addAttribute("reviewList", dao.getReviewListDao(eventNum));
		model.addAttribute("QA_List", dao.getQAListDao(eventNum));
		
		return "reservation/rvView";
	}
	
	@RequestMapping(value = "/eventLikeStatus", method = RequestMethod.POST)
	@ResponseBody
	public int eventLikeStatus(HttpSession session, Model model, HttpServletRequest request) throws JsonProcessingException {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		String sessionId = (String)session.getAttribute("sessionId");
		String selectedEvent = request.getParameter("selectedEvent");
		
		int isEventLiked = dao.getLikedEvent(sessionId, selectedEvent);
		
		System.out.println("eventLikeStatus");
		System.out.println(selectedEvent);
		System.out.println(isEventLiked);
		
		return isEventLiked;
	}
	
	@RequestMapping(value = "/reviewLikeStatus", method = RequestMethod.POST)
	@ResponseBody
	public String reviewLikeStatus(HttpSession session, Model model, HttpServletRequest request) throws JsonProcessingException {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		String sessionId = (String)session.getAttribute("sessionId");
		String selectedEvent = request.getParameter("selectedEvent");
		
		List<EventReviewLikeDto> likedReviewList = dao.getLikedReviewList(sessionId, selectedEvent);
		
		System.out.println("likeStatus");
		System.out.println(selectedEvent);
		System.out.println(likedReviewList);
		
		// ObjectMapper를 사용하여 JSON 형식으로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonLikedReviewList = objectMapper.writeValueAsString(likedReviewList);
		
		return jsonLikedReviewList;
	}
	
	@RequestMapping(value = "/eventLike")
	public String eventLike(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		String sessionId = (String)session.getAttribute("sessionId");
		String selectedEvent = request.getParameter("selectedEvent");
		
		System.out.println("eventLike");
		System.out.println(sessionId);
		System.out.println(selectedEvent);
		
		dao.eventLiker(selectedEvent, sessionId);
		model.addAttribute("selectedEvent", selectedEvent);
		
		return "reservation/rvView";
	}
	
	@RequestMapping(value = "/eventUnlike")
	public String eventUnlike(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		String sessionId = (String)session.getAttribute("sessionId");
		String selectedEvent = request.getParameter("selectedEvent");
		
		System.out.println("eventUnlike");
		System.out.println(sessionId);
		System.out.println(selectedEvent);
		
		dao.cancelEventLiker(selectedEvent, sessionId);
		model.addAttribute("selectedEvent", selectedEvent);
		
		return "reservation/rvView";
	}
	
	@RequestMapping(value = "/reviewLike")
	public String reviewLiked(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		String sessionId = (String)session.getAttribute("sessionId");
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		String selectedEvent = request.getParameter("selectedEvent");
		
		System.out.println("reviewLike");
		System.out.println(sessionId);
		System.out.println(request.getParameter("reviewNum"));
		System.out.println(selectedEvent);
		
		dao.reviewLiker(reviewNum, sessionId);
		model.addAttribute("selectedEvent", selectedEvent);
		
		return "reservation/rvView";
	}
	
	@RequestMapping(value = "/reviewUnlike")
	public String reviewUnlike(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		String sessionId = (String)session.getAttribute("sessionId");
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		String selectedEvent = request.getParameter("eventNum");
		
		System.out.println(sessionId);
		System.out.println(request.getParameter("reviewNum"));
		System.out.println(selectedEvent);
		
		dao.cancelReviewLiker(reviewNum, sessionId);
		model.addAttribute("selectedEvent", selectedEvent);
		
		return "reservation/rvView";
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
		
		return "reservation/confirmRev";
	}

	
}
