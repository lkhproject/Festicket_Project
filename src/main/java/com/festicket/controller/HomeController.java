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
import com.festicket.dto.CSboardDto;
import com.festicket.dto.Criteria;
import com.festicket.dto.EventDto;
import com.festicket.dto.PageDto;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/index")
	public String index(Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("festival_5", dao.top5FestivalListDao());
		model.addAttribute("exhibition_5", dao.top5ExhibitionListDao());
		
		return "index";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "/myPage")
	public String myPage() {
		return "myPage";
	}
	
	@RequestMapping(value = "/ranking")
	public String ranking(HttpServletRequest request, Model model) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("ongoing", dao.getOngoingEventDao());
		model.addAttribute("topfiveEvent", dao.getTopFiveEventsDao());
		
//		int ongoing = Integer.parseInt(request.getParameter("curr_event"));
//		
//		System.out.println(ongoing);
//		
//		model.addAttribute("ongoing", dao.getEventDao(ongoing));
		
		return "ranking";
	}
	
	@RequestMapping(value = "/exhibition")
	public String exhibition(HttpServletRequest request, Model model, Criteria criteria) {

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
		
		int totalCount = dao.totalExhibitionCountDao();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> exhibitionDtos = dao.exhibitionListDao(criteria.getCountList(), pageNum);
		
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("exhibitionDtos", exhibitionDtos);
		model.addAttribute("currPage", pageNum);
		
		return "exhibition";
	}
	
	@RequestMapping(value = "/festival")
	public String festival(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		int totalCount = dao.totalFestivalCountDao();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> festivalDtos = dao.festivalListDao(criteria.getCountList(), pageNum);
		
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("festivalDtos", festivalDtos);
		model.addAttribute("currPage", pageNum);
		
		return "festival";
	}


// *************************************************CS
	@RequestMapping(value = "/csBoardList")
	public String csBoardList(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		int totalCount = dao.csListTotalCountDao(); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalCount);	
		
		List<CSboardDto> CSboardDtos = dao.csListDao(criteria.getCountList(), pageNum);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("CSboardDtos", CSboardDtos);
		model.addAttribute("currPage", pageNum);
		
		return "csBoardList";
	}
	
	@RequestMapping(value = "/csBoardWrite")
	public String csBoardWrite() {
		return "csBoardWrite";
	}
	
	@RequestMapping(value = "/csBoardWriteOk")
	public String csBoardWriteOk(HttpServletRequest request) {
		
		String c_userId = request.getParameter("c_userId");
		String c_title = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csWriteDao(c_userId, c_title, c_content);
		
		return "redirect:csBoardList";
	}
	
	@RequestMapping(value = "/csBoardView")
	public String csBoardView(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csHitDao(request.getParameter("c_idx")); // 조회수 증가
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("c_idx")));
		model.addAttribute("replyList", dao.replyListDao(request.getParameter("c_idx")));
		
		return "csBoardView";
	}
	
	@RequestMapping(value = "/csBoardModify")
	public String csBoardModify(HttpServletRequest request, HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("csBoardDto", dao.csViewDao(request.getParameter("c_idx")));
		
//		String sessionId = (String) session.getAttribute("sessionId");
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		model.addAttribute("csBoardDto", dao.csViewDao(sessionId));
		
		return "csBoardModify";
	}
	
	@RequestMapping(value = "csModifyOk")
	public String csModifyOk(HttpServletRequest request, Model model) {
		
		String c_idx = request.getParameter("c_idx");
		String c_title = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csModifyDao(c_idx, c_title, c_content);
		
		model.addAttribute("csBoardDto", dao.csViewDao(c_idx)); // 수정이 된 후 글내용
		
		return "csModifyOk";
	}
	
	@RequestMapping(value = "/csBoardDelete")
	public String csBoardDelete(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.csDeleteDao(request.getParameter("c_idx"));	
		dao.boardReplyDeleteDao(request.getParameter("ca_boardNum"));
		
		return "redirect:csBoardList";
	}
	
	@RequestMapping(value = "/csBoardSearch")
	public String search_list(HttpServletRequest request, Model model, Criteria criteria) {
		
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

		String searchOption = request.getParameter("searchOption");
		String keyword = request.getParameter("keyword");
		
		if(searchOption.equals("title")) {
			int totalCount = dao.totalcsSearch_TitleCount(keyword);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<CSboardDto> CSboardDtos = dao.csSearchTitleDao(keyword, criteria.getCountList(), pageNum);
			
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("CSboardDtos", CSboardDtos);
			model.addAttribute("currPage", pageNum);
		}
		else if(searchOption.equals("content")) {
			int totalCount = dao.totalcsSearch_ContentCount(keyword);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<CSboardDto> CSboardDtos = dao.csSearchContentDao(keyword, criteria.getCountList(), pageNum);
			
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("CSboardDtos", CSboardDtos);
			model.addAttribute("currPage", pageNum);
		} else {
			int totalCount = dao.totalcsSearch_IdCount(keyword);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<CSboardDto> CSboardDtos = dao.csSearchWriterDao(keyword, criteria.getCountList(), pageNum);
			
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("CSboardDtos", CSboardDtos);
			model.addAttribute("currPage", pageNum);
		}
		return "csBoardSearch";
	}
	// *************************************************CS
	
	
	@RequestMapping(value = "/adminList")
	public String adminList(HttpServletRequest request, Model model, Criteria criteria) {
		
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
		
		List<EventDto> eventListDtos = dao.eventListDao(criteria.getCountList(), pageNum);
		
		request.setAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("eventListDtos", eventListDtos);
		model.addAttribute("currPage", pageNum);
		
		return "adminList";
	}
	
	@RequestMapping(value = "/adminAddEvent")
	public String adminList(Model model, HttpSession session, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
//		EventDto eventDto = dao.contentViewDao(request.getParameter("eventNum"));
//		
//		if(sessionId != null) {
//			model.addAttribute("eventDto", eventDto);
//		}
		
		return "adminAddEvent";
	}
	
	@RequestMapping(value = "/adminModify")
	public String adminModify(HttpSession session, Model model) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		return "adminModify";
	}
	
	@RequestMapping(value = "/adminEventAdd")
	public String adminEventAdd() {
		return "adminEventAdd";
	}
	
	@RequestMapping(value = "/searchResult")
	public String searchResult(HttpServletRequest request, Model model, Criteria criteria) {
		
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

		String keyword = request.getParameter("keyword");
		
		request.setAttribute("search_word", keyword);
		
		int totalResult = dao.totalSearchResultCount(keyword); // 모든 글의 개수
		
		PageDto pageDto = new PageDto(criteria, totalResult);
		
		List<EventDto> searchListDtos = dao.getSearchResult(keyword, criteria.getCountList(), pageNum);
		
		model.addAttribute("totalCount", totalResult);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("searchListDtos", searchListDtos);
		model.addAttribute("currPage", pageNum);
		
		return "searchResult";
	}
	
	@RequestMapping(value = "/reservation")
	public String reservation(HttpSession session, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
//		model.addAttribute("event", dao.eventListDao());
		
		return "reservation";
	}
	
	@RequestMapping(value = "/rvView")
	public String rvView(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
		
		model.addAttribute("event", dao.getEventDao(eventNum));
		model.addAttribute("reviewList", dao.getReviewListDao(eventNum));
		model.addAttribute("QA_List", dao.getQAListDao(eventNum));
		
		return "rvView";
	}
	
	@RequestMapping(value = "/qaView")
	public String qaView(HttpSession session, Model model, HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int qaNum = Integer.parseInt(request.getParameter("selectedQA"));
		
		dao.qaHitDao(qaNum);
		
		model.addAttribute("qaDto", dao.getQaDao(qaNum));
		
		return "qaView";
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
