package com.festicket.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.festicket.dao.IDao;
import com.festicket.dto.Criteria;
import com.festicket.dto.EventDto;
import com.festicket.dto.MainImgDto;
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
		
		int totalCount = dao.adminTotalEventCountDao();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<EventDto> eventListDtos = dao.adminEventListPagingDao(criteria.getCountList(), pageNum);
		
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
		MainImgDto mainImg = dao.getMainImgInfo(eNum);
		
		request.setAttribute("adminCheck", adminCheck);
		model.addAttribute("event", event);
		model.addAttribute("mainImg", mainImg);
		
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
   public String adminEventAddOk(Model model, HttpSession session, HttpServletRequest request, @RequestPart MultipartFile main_img) throws ParseException, IllegalStateException, IOException {
      
      String sessionId = (String)session.getAttribute("sessionId");
      
      int adminCheck = 0;
      int eventAddFlag = 0;
		
		if(sessionId.equals("admin")) {
			adminCheck = 1;
		}
      
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
       
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
               
       String start_dateStr = request.getParameter("start_date");
	   Date start_date = null;
	   start_date = dateFormat.parse(start_dateStr);
               
       String end_dateStr = request.getParameter("end_date");
       Date end_date = null;
	   end_date = dateFormat.parse(end_dateStr);
               
       String eventPrice = request.getParameter("eventPrice");
       int ticketCount = Integer.parseInt(request.getParameter("ticketCount"));
       
       String eventDate = start_dateStr + "~" + end_dateStr;
       
       // 파일 첨부
       
       String fileoriname = main_img.getOriginalFilename(); // 첨부된 파일의 원래 이름
       
       String fileextension = FilenameUtils.getExtension(fileoriname).toLowerCase(); // 파일의 확장자 소문자로 가져오기
       File destinationFile;
       String destinationFileName; // 실제 서버에 저장된 파일의 변경된 이름이 저장될 변수
       // 첨부된 파일이 저장된 서버의 실제 폴더 경로
       String fileurl = "/var/lib/tomcat9/webapps/Festicket_Project/WEB-INF/classes/static/upload_main_img";
       
       do {
			// 알파벳 대소문자+숫자로 이루어진 랜덤 32글자의 문자열 이름으로 된 파일 이름으로 생성 -> 서버에 이 이름으로 저장됨
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileextension;
			destinationFile = new File(fileurl + destinationFileName);
		} while(destinationFile.exists()); // 같은 파일 이름이 확시 존재하는지 확인
		
       String main_img_url = fileurl + destinationFileName; 
       
		destinationFile.getParentFile().mkdir();
		main_img.transferTo(destinationFile); // 업로드된 첨부된 파일이 지정한 폴더에 이동 완료!
		
		eventAddFlag = dao.eventAddDao(type, gunName, title, eventDate, place, org_name, use_trgt,
	            player, program, org_link, main_img_url,
	            start_date, end_date, eventPrice, ticketCount);
		
		List<EventDto> eventList = dao.eventAllListDao(); // 모든 글 목록 가져오기
	    EventDto eventDto = eventList.get(0); // 방금 쓴 글
	    int filenum = eventDto.getEventNum(); // 방금 쓴 글 번호(파일이 첨부된 글의 번호)
	    
	    dao.fileInfoCreateDao(filenum, fileoriname, destinationFileName, fileextension, fileurl);
	   
	   request.setAttribute("adminCheck", adminCheck);
	   request.setAttribute("eventAddFlag", eventAddFlag);
	   
      return "admin/adminEventAddOk";
   }
	
	@RequestMapping(value = "/adminEventUpdate")
   public String adminEventUpdate(Model model, HttpSession session, HttpServletRequest request, @RequestPart MultipartFile modify_main_img) throws ParseException, IllegalStateException, IOException {
      
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
       
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
               
       String start_dateStr = request.getParameter("start_date");
	   Date start_date = null;
	   start_date = dateFormat.parse(start_dateStr);
               
       String end_dateStr = request.getParameter("end_date");
       Date end_date = null;
	   end_date = dateFormat.parse(end_dateStr);
               
       String eventPrice = request.getParameter("eventPrice");
       int ticketCount = Integer.parseInt(request.getParameter("ticketCount"));
       
       String eventDate = start_dateStr + "~" + end_dateStr;
       
       String main_img_url;
    // 파일 첨부
    if(modify_main_img.isEmpty()) {
    	MainImgDto mainImg = dao.getMainImgInfo(eventNum);
        
        main_img_url = mainImg.getFileurl() + mainImg.getFilename();
     	
        dao.eventUpdateDao(eventNum, type, gunName, title, eventDate,
      			  place, org_name, use_trgt, player, program, org_link, main_img_url,
      			  start_date, end_date, eventPrice, ticketCount);
    } else {
		String fileoriname = modify_main_img.getOriginalFilename(); // 첨부된 파일의 원래 이름
        
        String fileextension = FilenameUtils.getExtension(fileoriname).toLowerCase(); // 파일의 확장자 소문자로 가져오기
        File destinationFile;
        String destinationFileName; // 실제 서버에 저장된 파일의 변경된 이름이 저장될 변수
        // 첨부된 파일이 저장된 서버의 실제 폴더 경로
        String fileurl = "D:/springboot_workspace/Festicket_Project/src/main/resources/static/upload_main_img/";
        
        do {
 			// 알파벳 대소문자+숫자로 이루어진 랜덤 32글자의 문자열 이름으로 된 파일 이름으로 생성 -> 서버에 이 이름으로 저장됨
 			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileextension;
 			destinationFile = new File(fileurl + destinationFileName);
 		} while(destinationFile.exists()); // 같은 파일 이름이 확시 존재하는지 확인
 		
        main_img_url = fileurl + destinationFileName; 
        
 		destinationFile.getParentFile().mkdir();
 		modify_main_img.transferTo(destinationFile); // 업로드된 첨부된 파일이 지정한 폴더에 이동 완료!
 		
 		// 원래 이미지 삭제
 		dao.deleteMainImg(eventNum);
 		dao.fileInfoCreateDao(eventNum, fileoriname, destinationFileName, fileextension, fileurl);
 		dao.eventUpdateDao(eventNum, type, gunName, title, eventDate,
    			  place, org_name, use_trgt, player, program, org_link, main_img_url,
    			  start_date, end_date, eventPrice, ticketCount);
    }
    
      return "redirect:adminList";
   }
	
	@RequestMapping(value = "/eventDelete")
	   public String eventDelete(HttpSession session, Model model, HttpServletRequest request) {
	      
	      IDao dao = sqlSession.getMapper(IDao.class);
	      
	      int eventNum = Integer.parseInt(request.getParameter("selectedEvent"));
	      
	      dao.eventDelete(eventNum);
	      dao.deleteMainImg(eventNum);
	      dao.adminDeleteReviewLike(eventNum);
	      dao.adminReviewDeleteDao(eventNum);
	      dao.adminReservationDeleteDao(eventNum);
	      dao.adminDeleteEventLike(eventNum);
	      dao.adminDeleteQAanswer(eventNum);
	      dao.adminDeleteQA(eventNum);
	      
	      return "redirect:adminList";
	   }
	
}