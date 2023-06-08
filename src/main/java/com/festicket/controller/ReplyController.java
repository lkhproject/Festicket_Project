package com.festicket.controller;

import javax.servlet.http.HttpServletRequest;

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
	public String reply_write(HttpServletRequest request, Model model) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.replyWriteDao(request.getParameter("ca_content"), request.getParameter("ca_boardNum"));
		dao.replyCountDao(request.getParameter("ca_boardNum")); // 원글의 댓글 수를 1증가
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("ca_boardNum")));
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("rorinum")));
		
		return "csBoardview";
	}

}
