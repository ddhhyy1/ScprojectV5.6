package com.studycafe.prac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.studycafe.prac.dao.MemberDao;
import com.studycafe.prac.dao.TodayTicketDao;
import com.studycafe.prac.dto.Criteria;
import com.studycafe.prac.dto.PageDto;
import com.studycafe.prac.dto.ScSalesDto;
import com.studycafe.prac.dto.memberDto;
import com.studycafe.prac.dto.seatDto;

@Controller
public class AdminController {

	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/adminMain")//관리자메인페이지
	public String adminMain() {
		
		
		return "admin/adminMain";
	}
	@RequestMapping(value="/admReservList")//관리자메인페이지
	public String admReservList(HttpSession session, Model model,HttpServletRequest request, Criteria cri) {
		
		TodayTicketDao tDao = sqlSession.getMapper(TodayTicketDao.class);
		
		//페이징 관련
		int totalRecord = tDao.getAllSeatCount();
		
		
		int pageNumInt = 0;
		if(request.getParameter("pageNum") == null ) {
			System.out.print(request.getParameter("pageNum"));
			pageNumInt = 1;
			cri.setPageNum(pageNumInt);
			
		}	else {	
			
			pageNumInt = Integer.parseInt( request.getParameter("pageNum"));
			cri.setPageNum(pageNumInt);
			
		}
//		cri.setPageNum();
	
		cri.setStartNum(cri.getPageNum()-1*cri.getAmount());
		PageDto pageDto= new PageDto(cri, totalRecord );
		
		List<seatDto> sDto= tDao.getAllSeatInfo(cri);
		
		model.addAttribute("sDto",sDto);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("currPage",pageNumInt);
		return "admin/admReservList";
	}
	
	@RequestMapping(value="/admOldReservList")//관리자메인페이지
	public String admOldReservList(Model model,HttpServletRequest request, Criteria cri) {
		
		TodayTicketDao tDao = sqlSession.getMapper(TodayTicketDao.class);
		
		int totalRecord = tDao.getAllOldSeatCount();
		
		
		List<seatDto> sDto= tDao.getAllOldSeatInfo(cri);
		
		
		model.addAttribute("sDto",sDto);
		
		
		return "admin/admOldReservList";
	}
	
	@RequestMapping(value="/admMemberList")//회원관리페이지
	public String admMemberList(HttpSession session, Model model,HttpServletRequest request, Criteria cri) {
			
		String sessionId = (String) session.getAttribute("userId");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		//페이징 관련
		int totalRecord = dao.memberAllCount();
		
		int pageNumInt = 0;
		if(request.getParameter("pageNum") == null ) {
		
			pageNumInt = 1;
			cri.setPageNum(pageNumInt);
			
		}	else {	
			
			pageNumInt = Integer.parseInt( request.getParameter("pageNum"));
			cri.setPageNum(pageNumInt);
			
		}
//		cri.setPageNum();
	
		cri.setStartNum(cri.getPageNum()-1*cri.getAmount());
		PageDto pageDto= new PageDto(cri, totalRecord );
		
		
		//페이징 관련 끝
		
		
		List<memberDto> qboardDtos = dao.getAllMemberInfo(cri);
		
		model.addAttribute("pageMaker", pageDto);
		
		ArrayList<memberDto> memberDto = dao.getAllMemberInfo(cri);
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("currPage",pageNumInt);	
		
		return "admin/admMemberList";
	}
	@RequestMapping(value="/admUserInfo")//회원정보 조회
	public String admUserInfo(Model model, HttpServletRequest request) {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		String userId = request.getParameter("userId");
		
		memberDto memberDto = dao.getMemberInfo(userId);
		
		model.addAttribute("memberDto", memberDto);
		
		
		return "admin/admUserInfo";
	}
	
	@RequestMapping(value="/admUserEdit")//회원정보 수정
	public String userEdit(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		String userId = request.getParameter("userId");
		String userPoint = request.getParameter("userPoint");
		String usingTicket = request.getParameter("usingTicket");
		
		dao.updateUticketPoint(userId, userPoint, usingTicket);
		
		
		try {
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('변경완료!');window.location.href = 'admMemberList'</script>");
		    out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "admin/admMemberList";
	}
	
	@RequestMapping(value="/admMemberKick")//회원 강퇴
	public String admMemberKick(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		String userId = request.getParameter("userId");
		
		dao.admMemberKick(userId);
		
		
		try {
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('강퇴 완료!');window.location.href = 'admMemberList'</script>");
		    out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "admin/admMemberList";
	}
	
	@RequestMapping(value="/admCheckSales")//매출 체크
	public String admCheckSales(Model model) {
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		
		List<ScSalesDto> salesDto = dao.getChartInfo(); //ASC로 월별 그룹화 하여 매출 가져옴
		List<ScSalesDto> salesDto2 = dao.getChartInfo2(); //DESC로 월별 그룹화 하여 매출 가져옴
		
		//DESC로 시도
		List<String> SalesForMonthR = new ArrayList<String>(); //새리스트 선언
		for(int i=0; i<salesDto2.size();i++) {
			SalesForMonthR.add(salesDto2.get(i).getSumSales()); //SalesForMonth 리스트에 0번째부터 사이즈만큼 넣기
			
			}
		
		
		
		 List<String> SalesForMonth2 = new ArrayList<String>();
		    for(int f = 0; f<SalesForMonthR.size();f++) {
		    	SalesForMonth2.add(SalesForMonthR.get(f));
		    }
		    for(int z=0; z<SalesForMonth2.size();z++) {
				System.out.println(SalesForMonth2.get(z));
			}
		 model.addAttribute("SalesForMonth2",SalesForMonth2);
		return "admin/admCheckSales";
	}
}
