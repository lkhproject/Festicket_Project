package com.festicket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.festicket.dao.IDao;

@Controller
public class ReplyController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/replyWrite")
	public String replyWrite(HttpServletRequest request, HttpSession session, Model model) {
		
		String sessionId = (String)session.getAttribute("sessionId");

		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.replyWriteDao(request.getParameter("sessionId"), request.getParameter("ca_content"), request.getParameter("ca_boardNum"));
		dao.replyCountDao(request.getParameter("ca_boardNum")); // 원글의 댓글 수를 1증가
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("ca_boardNum")));
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("ca_boardNum")));
		
		return "csBoardView";
	}
	
	@RequestMapping(value = "/replyDelete")
	public String reply_delete(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.replyDeleteDao(request.getParameter("ca_idx")); // 댓글 삭제
		dao.replyCountMinusDao(request.getParameter("ca_boardNum")); // 댓글 개수 1개 삭제
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("ca_boardNum")));	
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("ca_boardNum")));
		
		return "csBoardView";
	}

}
