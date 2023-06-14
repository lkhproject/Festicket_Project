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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.festicket.dao.IDao;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/index")
	public String index() {

		
		return "index";
	}
	
	
	@RequestMapping(value = "/join")
	public String join() {	
		return "join";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/find")
	public String find() {	
		return "find";
	}
	
	@PostMapping("/finduserInfo")
	    public ModelAndView findUserInfo(@RequestParam("email") String email,
	                                     @RequestParam("userPhone") String userPhone,
	                                     @RequestParam(value = "findIdBtn", required = false) String findIdBtn,
	                                     @RequestParam(value = "findPwdBtn", required = false) String findPwdBtn) {
	        ModelAndView modelAndView = new ModelAndView();

	        if (findIdBtn != null) {
	            // 아이디 찾기 버튼이 클릭된 경우의 로직
	            String userId = findUserIdByEmailAndPhone(email, userPhone);
	            if (userId != null) {
	                modelAndView.addObject("userId", userId);
	                modelAndView.setViewName("findIdSuccess"); // 아이디가 존재하는 경우의 결과 페이지
	            } else {
	                modelAndView.setViewName("findIdFailure"); // 아이디가 존재하지 않는 경우의 결과 페이지
	            }
	        } else if (findPwdBtn != null) {
	            // 비밀번호 찾기 버튼이 클릭된 경우의 로직
	            // 비밀번호 재설정 등의 처리 로직을 구현
	        }
	        
	        return modelAndView;
	    }
	    
	    // 아이디 찾기를 위한 메소드 예시
	    private String findUserIdByEmailAndPhone(String email, String phone) {
	        // 이메일과 휴대폰번호를 사용하여 데이터베이스에서 아이디를 조회하는 로직을 구현해야 함
	        // 실제로 데이터베이스 조회를 수행하거나 다른 방식으로 아이디를 찾는 로직을 작성해야 함
	        // 조회 결과에 따라 아이디를 반환하거나 null을 반환할 수 있음
	        
	        // 아래는 예시로 하드코딩된 값으로 아이디를 반환하는 예시 로직
	        if (email.equals("example@example.com") && phone.equals("01012345678")) {
	            return "finduserInfo";
	        } else {
	            return null;
	        }
	    }
	
	@RequestMapping(value = "/myPageUnreg")
	public String myPageUnreg(HttpServletRequest request) {
		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		dao.deleteDao(request.getParameter("userId"));
//		dao.deleteDao(request.getParameter("userPassword"));
//		
		
		return "myPageUnreg";
	}
	
	@RequestMapping(value = "/myPage")
	public String myPage() {
		
		return "myPage";
	}
	
	@RequestMapping(value = "/myPageModify")
	public String myPageModify() {
		
		return "myPageModify";
	}

	@RequestMapping(value = "/joinOk")
	public String joinOk(HttpServletRequest request, Model model) throws ParseException {
		
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String userPhone = request.getParameter("userPhone");

		IDao dao = sqlSession.getMapper(IDao.class);
	
		int joinCheck = 0;
		
		int checkId = dao.checkIdDao(userId);//가입하려는 id 존재여부 체크 1이면 이미 존재
		int checkEmail = dao.checkEmailDao(email);
		
		if(checkId == 0 && checkEmail == 0) {
			Date now = new Date();
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        String strToday = formatter.format(now);
	        Date today = formatter.parse(strToday);
	        
			joinCheck = dao.joinDao(userId, userPassword, userPhone, email, name, today);
			model.addAttribute("checkId", checkId);
			model.addAttribute("checkEmail", checkEmail);
		//joinCheck 값이 1이면 회원가입 성공, 아니면 가입실패
		} else {
			model.addAttribute("checkId", checkId);
			model.addAttribute("checkEmail", checkEmail);
		}
		
		if(joinCheck == 1) {
			model.addAttribute("joinFlag", joinCheck);
			model.addAttribute("memberName", name);
			model.addAttribute("memberId", userId);
		} else {//회원가입실패
			model.addAttribute("joinFlag", joinCheck);
		}
		
		return "joinOk";
	}
	
	@RequestMapping(value = "/loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkIdPwFlag = dao.checkIdPwDao(userId,userPassword);
		//1이면 로그인 성공, 0이면 로그인 실패
		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if(checkIdPwFlag == 1) {//로그인 성공 실행
			session.setAttribute("sessionId", userId);			
			
			model.addAttribute("memberDto", dao.getMemberInfo(userId));
		}
		
		return "loginOk";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
	    // 세션 객체 가져오기
	    HttpSession session = request.getSession();
	    
	    // 세션 무효화 (세션 제거)
	    session.invalidate();
	    
	    // 로그아웃 후 리다이렉트할 경로를 리턴합니다.
	    return "logout";
	
	}
	@RequestMapping(value = "/ranking")
	public String ranking() {
		
		return "ranking";
	}
	
	@RequestMapping(value = "/exhibition")
	public String exhibition() {
		
		return "exhibition";
	}
	
	@RequestMapping(value = "/festival")
	public String festival() {
		
		return "festival";
	}
	
	@RequestMapping(value = "/csBoardList")
	public String csBoardList() {
		
		return "csBoardList";
	}
	
	@RequestMapping(value = "/csBoardWrite")
	public String csBoardWrite() {
		
		return "csBoardWrite";
	}
	
	@RequestMapping(value = "/adminList")
	public String adminList(HttpServletRequest request, Model model) {
		
		
		return "adminList";
	}
	
	@RequestMapping(value = "/adminAddEvent")
	public String adminList(Model model, HttpSession session, HttpServletRequest request) {

		return "adminAddEvent";
	}
	
	@RequestMapping(value = "/adminModify")
	public String adminModify(HttpSession session, Model model) {
			
		return "adminModify";
	}
	
	@RequestMapping(value = "/adminEventAdd")
	public String adminEventAdd() {
		
		return "adminEventAdd";
	}
	
	
}