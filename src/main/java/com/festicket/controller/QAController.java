package com.festicket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

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

@Controller
public class QAController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/qaView")
	public String qaView(HttpSession session, Model model, HttpServletRequest request) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		String strQAnum = request.getParameter("selectedQA");
		
		int qaNum = Integer.parseInt(strQAnum);
		
		dao.qaHitDao(qaNum);
		
		model.addAttribute("qaDto", dao.getQaDao(qaNum));
		model.addAttribute("QAreplyList", dao.QAreplyListDao(strQAnum));
		
		return "QA/qaView";
	}
	
	@RequestMapping(value = "/qaBoardWrite")
	public String qaBoardWrite(HttpSession session, Model model, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		int eventNum = (int)session.getAttribute("eventNum");
		
		request.setAttribute("sessionId", sessionId);
		request.setAttribute("eventNum", eventNum);
		
		return "QA/qaBoardWrite";
	}
	
	@RequestMapping(value = "/qaBoardWriteOk")
	public String qaBoardWriteOk(HttpSession session, Model model, HttpServletRequest request) throws ParseException {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int q_eventNum = (int)session.getAttribute("eventNum");
		String q_title = request.getParameter("q_title");
		String q_content = request.getParameter("q_content");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strToday = formatter.format(now);
        Date today = formatter.parse(strToday);
        
		dao.qaWriteDao(q_eventNum, sessionId, q_title, q_content, today, 0);
		
		return "redirect:qaBoardList";
	}
	
	@RequestMapping(value = "/qaBoardDelete")
	public String qaBoardDelete(HttpSession session, Model model, HttpServletRequest request) throws ParseException {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.qaDeleteDao(request.getParameter("selectedQA"));	
		dao.QAboardReplyDeleteDao(request.getParameter("qa_boardNum"));
		
		return "redirect:qaBoardList";
	}
	
	@RequestMapping(value = "/qaBoardModify")
	public String qaBoardModify(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int qaNum = Integer.parseInt(request.getParameter("selectedQA"));
		
		model.addAttribute("qaDto", dao.getQaDao(qaNum));
		
		return "QA/qaBoardModify";
	}
	
	@RequestMapping(value = "/qaBoardModifyOk")
	public String qaBoardModifyOk(HttpSession session, Model model, HttpServletRequest request) throws ParseException {
		
		String q_idx = request.getParameter("selectedQA");
		String q_userId = request.getParameter("q_userId");
		String q_title = request.getParameter("q_title");
		String q_content = request.getParameter("q_content");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.qaModifyDao(q_idx, q_userId, q_title, q_content);
		
		int q_idxInt = Integer.parseInt(q_idx);
		
		model.addAttribute("qaDto", dao.getQaDao(q_idxInt));
		
		return "QA/qaBoardModifyOk";
	}
	
	@RequestMapping(value = "/qaBoardList")
	public String qaBoardList(HttpSession session, Model model, HttpServletRequest request, Criteria criteria) throws ParseException {
		
		String sessionId = (String)session.getAttribute("sessionId");

		IDao dao = sqlSession.getMapper(IDao.class);
		
		// 선택한 이벤트 번호 등을 세션에 저장하고 이후에 필요한 곳에서 사용
		int eventNum = (int) session.getAttribute("eventNum");
		
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
		
		int totalCount = dao.totalQAListCountDao(eventNum); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalCount);	
				
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		// 리스트로 넘어가기 때문에 title은 따로 넘겨줘야함 
		model.addAttribute("QAListDtos", dao.getQAListPagingDao(eventNum, criteria.getCountList(), pageNum));
		model.addAttribute("currPage", pageNum);
		request.setAttribute("event", dao.getEventDao(eventNum));
		
		return "QA/qaBoardList";
	}
	
	@RequestMapping(value = "/QAreplyWrite")
	public String QAreplyWrite(HttpServletRequest request, HttpSession session, Model model) {
		
		String sessionId = (String)session.getAttribute("sessionId");

		IDao dao = sqlSession.getMapper(IDao.class);
		
		int qa = Integer.parseInt(request.getParameter("selectedQA"));
		
		dao.QAreplyWriteDao(request.getParameter("sessionId"), request.getParameter("selectedQA"), request.getParameter("qa_content"));
		dao.QAreplyCountDao(request.getParameter("selectedQA")); // 원글의 댓글 수를 1증가
		
		model.addAttribute("qaDto", dao.getQaDao(qa));
		model.addAttribute("QAreplyList", dao.QAreplyListDao(request.getParameter("selectedQA")));
		
		return "QA/qaView";
	}
	
	@RequestMapping(value = "/QAreplyDelete")
	public String QAreply_delete(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		System.out.println(request.getParameter("qa_idx"));
		System.out.println(request.getParameter("qa_boardNum"));
		
		dao.QAreplyDeleteDao(request.getParameter("qa_idx")); // 댓글 삭제
		dao.QAreplyCountMinusDao(request.getParameter("qa_boardNum")); // 댓글 개수 1개 삭제
		// 삭제안됌-- null값
		
		int qa = Integer.parseInt(request.getParameter("qa_boardNum"));
		
		model.addAttribute("qaDto", dao.getQaDao(qa));	
		model.addAttribute("QAreplyList", dao.QAreplyListDao(request.getParameter("qa_boardNum")));
		
		return "QA/qaView";
	}
}