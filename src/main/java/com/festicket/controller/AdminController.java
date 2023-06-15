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

import com.festicket.dao.IDao;
import com.festicket.dto.Criteria;
import com.festicket.dto.EventDto;
import com.festicket.dto.PageDto;

@Controller
public class AdminController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/adminList")
	public String adminList(HttpSession session, HttpServletRequest request, Model model, Criteria criteria) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int adminCheck = 0;
		
		if(sessionId.equals("admin")) {
			adminCheck = 1;
		}
		
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
		
		int totalCount = dao.totalEventCountDao();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> eventListDtos = dao.eventListPagingDao(criteria.getCountList(), pageNum);
		
		request.setAttribute("adminCheck", adminCheck);
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("eventListDtos", eventListDtos);
		model.addAttribute("currPage", pageNum);
		
		return "admin/adminList";
	}
	
	@RequestMapping(value = "/adminModify")
	public String adminModify(HttpSession session, Model model, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int adminCheck = 0;
		
		if(sessionId.equals("admin")) {
			adminCheck = 1;
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int eNum = Integer.parseInt(request.getParameter("selectedEvent"));
		
		EventDto event = dao.getEventDao(eNum);
		
		request.setAttribute("adminCheck", adminCheck);
		model.addAttribute("event", event);
		
		return "admin/adminModify";
	}
	
	@RequestMapping(value = "/adminEventAdd")
	public String adminEventAdd(HttpSession session, Model model, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int adminCheck = 0;
		
		if(sessionId.equals("admin")) {
			adminCheck = 1;
		}
		
		request.setAttribute("adminCheck", adminCheck);
		
		return "admin/adminEventAdd";
	}
	
	@RequestMapping(value = "/adminEventAddOk")
   public String adminEventAddOk(Model model, HttpSession session, HttpServletRequest request) throws ParseException {
      
      String sessionId = (String)session.getAttribute("sessionId");
      
      IDao dao = sqlSession.getMapper(IDao.class);
      
      String type = request.getParameter("inputGroupSelect01");
       String gunName = request.getParameter("gunName");
       String title = request.getParameter("title");
       String place = request.getParameter("place");
       String org_name = request.getParameter("org_name");
       String use_trgt = request.getParameter("use_trgt");
       String player = request.getParameter("player");
       String program = request.getParameter("program");
       String org_link = request.getParameter("org_link");
       String main_img = request.getParameter("main_img");
       String rgstDateStr = request.getParameter("rgstDate");
       
       Date rgstDate = null;
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   rgstDate = dateFormat.parse(rgstDateStr);
               
       String start_dateStr = request.getParameter("start_date");
	   Date start_date = null;
	   start_date = dateFormat.parse(start_dateStr);
               
       String end_dateStr = request.getParameter("end_date");
       Date end_date = null;
	   end_date = dateFormat.parse(end_dateStr);
               
       String eventPrice = request.getParameter("eventPrice");
       int ticketCount = Integer.parseInt(request.getParameter("ticketCount"));
       
       String eventDate = start_dateStr + "~" + end_dateStr;
      
	   dao.eventAddDao(type, gunName, title, eventDate, place, org_name, use_trgt,
	            player, program, org_link, main_img, rgstDate,
	            start_date, end_date, eventPrice, ticketCount);
      
      return "redirect:adminList";
   }
	
	@RequestMapping(value = "/adminEventUpdate")
   public String adminEventUpdate(Model model, HttpSession session, HttpServletRequest request) throws ParseException {
      
      String sessionId = (String)session.getAttribute("sessionId");
      
      int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
      
      IDao dao = sqlSession.getMapper(IDao.class);
      
      String type = request.getParameter("inputGroupSelect01");
       String gunName = request.getParameter("gunName");
       String title = request.getParameter("title");
       String place = request.getParameter("place");
       String org_name = request.getParameter("org_name");
       String use_trgt = request.getParameter("use_trgt");
       String player = request.getParameter("player");
       String program = request.getParameter("program");
       String org_link = request.getParameter("org_link");
       String main_img = request.getParameter("main_img");
       String rgstDateStr = request.getParameter("rgstDate");
       
       Date rgstDate = null;
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   rgstDate = dateFormat.parse(rgstDateStr);
               
       String start_dateStr = request.getParameter("start_date");
	   Date start_date = null;
	   start_date = dateFormat.parse(start_dateStr);
               
       String end_dateStr = request.getParameter("end_date");
       Date end_date = null;
	   end_date = dateFormat.parse(end_dateStr);
               
       String eventPrice = request.getParameter("eventPrice");
       int ticketCount = Integer.parseInt(request.getParameter("ticketCount"));
       
       String eventDate = start_dateStr + "~" + end_dateStr;
       
       dao.eventUpdateDao(eventNum, type, gunName, title, eventDate,
     			  place, org_name, use_trgt, player, program, org_link, main_img,
     			  rgstDate, start_date, end_date, eventPrice, ticketCount);
      
      return "redirect:adminList";
   }
}