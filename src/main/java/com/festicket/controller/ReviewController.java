package com.festicket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;

@Controller
public class ReviewController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/myPageReview")
	public String myPageReview() {
		
//		IDao dao = sqlSession.getMapper(IDao.class);
		
//		int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
//		
//		model.addAttribute("event", dao.getEventDao(eventNum));
//		model.addAttribute("reviewDtos", dao.getReviewListDao(eventNum));
		
		return "myPageReview";
	}
	
	@RequestMapping(value = "/reviewWrite")
	public String reviewWrite() {
		return "reviewWrite";
	}
	
    @RequestMapping(value = "/reviewWriteOk")
    public String csBoardWriteOk(HttpServletRequest request) {
      
    	String rw_userId = request.getParameter("rw_userId");
    	String rw_eventNum = request.getParameter("rw_eventNum");
	    String rw_rating = request.getParameter("rw_rating");
	    String rw_content = request.getParameter("rw_content");
	      
	    IDao dao = sqlSession.getMapper(IDao.class);
	      
	    dao.reviewWriteDao(rw_userId, rw_eventNum, rw_rating, rw_content);
	    
	    return "redirect:myPageReview";
	}
    
}
