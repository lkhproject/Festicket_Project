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
import org.springframework.web.bind.annotation.RequestParam;

import com.festicket.dao.IDao;
import com.festicket.dto.Criteria;
import com.festicket.dto.PageDto;
import com.festicket.dto.ReserveDto;
import com.festicket.dto.ReviewDto;

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
			
			List<ReserveDto> revListDtos = dao.getReservationListDao(sessionId, criteria.getCountList(), pageNum);
			
			request.setAttribute("loginOk", loginOk);
			request.setAttribute("totalCount", totalCount);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("revListDtos", revListDtos);
			model.addAttribute("currPage", pageNum);
		}
		return "myPage/myPage";
	}
	
	@RequestMapping("/myPageDaysBefore")
	public String myPageDaysBefore(@RequestParam("days") int days, HttpServletRequest request, Model model, HttpSession session, Criteria criteria) {
	    
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
			
			int totalCount = dao.countRevList_days(sessionId, days);
			
			System.out.println(totalCount);
			
			PageDto pageDto = new PageDto(criteria, totalCount);
			
			List<ReserveDto> revListDtos = dao.getRevList_days(sessionId, criteria.getCountList(), pageNum, days);
			
			request.setAttribute("loginOk", loginOk);
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("days", days);
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("revListDtos", revListDtos);
			model.addAttribute("currPage", pageNum);
		}

	    return "myPage/myPageDaysBefore"; // 결과를 보여줄 뷰 이름 반환
	}
	
	@RequestMapping(value = "/detailedRev") // 예매내역으로 바로 이동
	public String detailedRev(HttpServletRequest request, Model model, HttpSession session, Criteria criteria) throws ParseException {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int reservedNum = Integer.parseInt(request.getParameter("selectedRev"));
		
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String today = formatter.format(now);
		
		ReserveDto reserved = dao.getReservationDao(reservedNum, sessionId);

		model.addAttribute("details", reserved);
		request.setAttribute("today", today);
		
		return "myPage/detailedRev";
	}
	
	@RequestMapping(value = "/cancelRev") // 예매 취소
	public String cancelRev(HttpSession session, Model model, HttpServletRequest request) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int revNum = Integer.parseInt(request.getParameter("re_idx"));
		int eventNum = Integer.parseInt(request.getParameter("re_eventNum"));
		
		int revTicketCount = dao.getTicketCountByidx(revNum);
		dao.addTicketDao(eventNum, revTicketCount);
		dao.cancelRevDao(sessionId, revNum);
		
		return "redirect:myPage";
	}

	@RequestMapping(value = "/myPageReview") // 리뷰 리스트
	public String myPageReview(HttpServletRequest request, Model model, HttpSession session, Criteria criteria) {
		
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
			
			List<ReserveDto> revListDtos = dao.getReservationListDao(sessionId, criteria.getCountList(), pageNum);
		
			if (!revListDtos.isEmpty()) {
			    ReserveDto reserveDto = revListDtos.get(0);
			    int eventNum = reserveDto.getRe_eventNum();
			    session.setAttribute("eventNum", eventNum);
			} else {
			    // 리스트가 비어있을 때의 처리
			    session.removeAttribute("eventNum"); // eventNum 제거 또는 기본값 설정
			}
		    
			request.setAttribute("loginOk", loginOk);
			request.setAttribute("totalCount", totalCount);
			
			model.addAttribute("pageMaker", pageDto);
			model.addAttribute("currPage", pageNum);
			model.addAttribute("revListDtos", revListDtos);
		}
		return "myPage/myPageReview";
	}
	
	@RequestMapping(value = "/reviewWrite") // 리뷰 작성
	public String reviewWrite(HttpServletRequest request, HttpSession session, Model model) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		int loginOk = 0;
		  
		if(sessionId != null && !sessionId.isEmpty()) {
		   loginOk = 1;
		}
		
	    String eventNumParam = request.getParameter("re_eventNum");
	    int eventNum = 0;

	    if (eventNumParam != null && !eventNumParam.isEmpty()) {
	        eventNum = Integer.parseInt(eventNumParam);
	    }
	    
		request.setAttribute("loginOk", loginOk);
		request.setAttribute("sessionId", sessionId);
		request.setAttribute("eventNum", eventNum);
		request.setAttribute("re_idx", request.getParameter("re_idx"));
		request.setAttribute("rw_idx", request.getParameter("rw_idx"));
		
		return "myPage/reviewWrite";
	}
	
    @RequestMapping(value = "/reviewWriteOk") // 리뷰 작성
    public String reviewWriteOk(HttpServletRequest request, HttpSession session) {
    	
    	String sessionId = (String)session.getAttribute("sessionId");
    	
    	int rw_eventNum = Integer.parseInt(request.getParameter("eventNum"));
	    String rw_rating = request.getParameter("rw_rating");
	    String rw_content = request.getParameter("rw_content");
	    int re_idx = Integer.parseInt(request.getParameter("re_idx"));
	      
	    IDao dao = sqlSession.getMapper(IDao.class);
	      
	    dao.reviewWriteDao(sessionId, rw_eventNum, rw_rating, rw_content);
	    
	    List<ReviewDto> reviewDtos = dao.getReviewListDao(rw_eventNum);
	    ReviewDto reviewDto = reviewDtos.get(0); // 방금 쓴 글
	    int reviewNum = reviewDto.getRw_idx(); // 방금 쓴 글 번호
	    
	    dao.reviewWrittenDao(re_idx, reviewNum);
	    
	    request.setAttribute("reviewListDtos", reviewDtos);
	    
	    return "redirect:myPageReview";
	}
    
    @RequestMapping(value = "/reviewView") // 리뷰 내용 보기
    public String reviewView(HttpServletRequest request, HttpSession session, Model model) {
    	
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		request.setAttribute("re_idx", request.getParameter("re_idx"));
		request.setAttribute("rw_idx", request.getParameter("rw_idx"));
		
		model.addAttribute("reviewDto", dao.reviewViewDao(request.getParameter("rw_idx")));
		model.addAttribute("sessionId", sessionId);
    	
    	return "myPage/reviewView";
    }
    
	@RequestMapping(value = "/reviewModify") // 리뷰 수정
	public String csBoardModify(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("reviewDto", dao.reviewViewDao(request.getParameter("rw_idx")));
		
		return "myPage/reviewModify";
	}
	
	@RequestMapping(value = "reviewModifyOk") // 리뷰 수정
	public String csBoardModifyOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String rw_idx = request.getParameter("rw_idx");
		String rw_userId = request.getParameter("rw_userId");
		String rw_eventNum = request.getParameter("rw_eventNum");
		String rw_rating = request.getParameter("rw_rating");
		String rw_content = request.getParameter("rw_content");
		
		dao.reviewModifyDao(rw_idx, rw_userId, rw_eventNum, rw_rating, rw_content);
		
		model.addAttribute("reviewDto", dao.reviewViewDao(rw_idx)); // 수정이 된 후 글내용
		
		return "myPage/reviewModifyOk";
	}
	
	@RequestMapping(value = "/reviewDelete") // 리뷰 삭제
	public String reviewDelete(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int rw_idx = Integer.parseInt(request.getParameter("rw_idx"));
		
		dao.reviewDeleteDao(request.getParameter("rw_idx"));
		dao.reviewWrittenDao(rw_idx, 0);

		return "redirect:myPageReview";
	}
    
	@RequestMapping(value = "/myPageModify")
	public String myPageModify(HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("memberDto", dao.getMemberInfo(userId));		
		
		return "myPage/myPageModify";
	}
	
	@RequestMapping(value = "/myPageModifyOk")
	 public String myPageModifyOk(HttpServletRequest request, Model model) {
	     
	     String userId = request.getParameter("userId");
	     String userPassword = request.getParameter("userPassword");
	     String userPhone = request.getParameter("userPhone");
	     String email = request.getParameter("email");
	     String name = request.getParameter("name");
	     
	     IDao dao = sqlSession.getMapper(IDao.class);
	     
	     dao.modifyMemberDao(userId, userPassword, userPhone, email, name);
	     
	     return "redirect:myPage";
	  }
    
	@RequestMapping(value = "/myPageUnreg")
		public String memberdelete(HttpSession session, Model model) {		
			
		String userId = (String) session.getAttribute("sessionId");
			
		IDao dao = sqlSession.getMapper(IDao.class);
		System.out.println(userId);
		model.addAttribute("memberDto", dao.getMemberInfo(userId));		
			
		return "myPage/myPageUnreg";
	}
		
	@RequestMapping(value = "/myPageUnregOk")
	public String delete_form(HttpServletRequest request, Model model, HttpSession session) {
		
		 String userId = request.getParameter("userId");
	     String userPassword = request.getParameter("userPassword");
	     
	     IDao dao = sqlSession.getMapper(IDao.class);
	     
	     dao.deleteMember(userId, userPassword);
	  	     
	     HttpSession session1 = request.getSession(false);
	     if (session1 != null) {
	         session1.invalidate(); // 세션 만료
	     }
		return  "redirect:index";
	}
	
}