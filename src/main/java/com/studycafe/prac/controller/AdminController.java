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

@Controller
public class AdminController {

	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/adminMain")//관리자메인페이지
	public String adminMain() {
		
		
		return "admin/adminMain";
	}
	@RequestMapping(value="/admMemberList")//회원관리페이지
	public String admMemberList(HttpSession session, Model model,HttpServletRequest request, Criteria cri) {
			
		String sessionId = (String) session.getAttribute("userId");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
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
		
		List<memberDto> qboardDtos = dao.getAllMemberInfo(cri);
		
		model.addAttribute("pageMaker", pageDto);
		
		ArrayList<memberDto> memberDto = dao.getAllMemberInfo(cri);
		
		model.addAttribute("memberDto", memberDto);
			
		
		return "admin/admMemberList";
	}
	@RequestMapping(value="/admUserInfo")//관리자메인페이지
	public String admUserInfo(Model model, HttpServletRequest request) {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		String userId = request.getParameter("userId");
		
		memberDto memberDto = dao.getMemberInfo(userId);
		
		model.addAttribute("memberDto", memberDto);
		
		
		return "admin/admUserInfo";
	}
	
	@RequestMapping(value="/admUserEdit")//관리자메인페이지
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
	
	@RequestMapping(value="/admMemberKick")//관리자메인페이지
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
	
	@RequestMapping(value="/admCheckSales")//관리자메인페이지
	public String admCheckSales() {
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		
		List<ScSalesDto> salesDto = dao.getChartInfo();
		
		List<String> SalesForMonth = new ArrayList<String>();
		for(int i=0; i<=SalesForMonth.size();i++) {
			SalesForMonth.add(salesDto.get(i).getPrice());
			System.out.println(SalesForMonth.get(i));
			}
		
		return "admin/admCheckSales";
	}
}
