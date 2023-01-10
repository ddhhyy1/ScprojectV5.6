package com.studycafe.prac.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.studycafe.prac.dao.MemberDao;
import com.studycafe.prac.dao.TodayTicketDao;
import com.studycafe.prac.dto.memberDto;
import com.studycafe.prac.dto.seatDto;


@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "testpage3")
	public String testpage3() {
		return "test/testpage3";
	}
	@RequestMapping(value = "/")
	public String home() {
		return "redirect:index";
	}
	
	@RequestMapping(value = "/index")
	public String index(Model model) {
		
		return "index";
	}
	
	@RequestMapping(value="/memberLogin")
	public String memberLogin() {
		
		return "memberLogin";
	}
	
	@RequestMapping(value = "loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		int checkIdFlag = dao.checkUserId(userId);//1이면 로그인ok, 0이면 로그인x
		
		int checkIdPwFlag = dao.checkUserIdAndPw(userId, userPw);
		
		model.addAttribute("checkIdFlag", checkIdFlag);		
		model.addAttribute("checkIdPwFlag", checkIdPwFlag);
		
		if(checkIdPwFlag  == 1) {//참이면 로그인 성공
			
			session.setAttribute("userId", userId);
			memberDto memberDto = dao.getMemberInfo(userId);
			
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("userId", userId);
		}
	
		
		return "loginOk";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "memberLogin";
	}
	
	@RequestMapping(value = "/memberJoin")//사용자 회원가입
	public String memberJoin() {
				
		return "memberJoin";
	}
	
	@RequestMapping(value = "/JoinOk")
	public String JoinOk(HttpServletRequest request, HttpSession session, Model model) {
		
		String uId = request.getParameter("userId");
		String uPw = request.getParameter("userPw");
		String uName = request.getParameter("userName");
		String uPhone = request.getParameter("userPhone");
		String uEmail = request.getParameter("userEmail");
		String uPoint = request.getParameter("userPoint");
		String uTicket = request.getParameter("usingTicket");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		int joinFlag = dao.joinMember(uId, uPw, uName, uPhone ,uEmail, uPoint,uTicket);
		
		if(joinFlag == 1) {//회원가입 성공시 바로 로그인 진행
			session.setAttribute("memberId", uId);
			session.setAttribute("memberName", uName);
			
			model.addAttribute("uName", uName);
			model.addAttribute("uId", uId);
			
			return "JoinOk";
		} else { //회원가입 실패
			return "JoinFail";
		}	
		
	} 
	

	@RequestMapping(value = "/memberInfo")
	public String memberInfo(HttpServletRequest request, HttpSession session, Model model) {
		
		String sessionId = (String) session.getAttribute("userId");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		memberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberInfo";
		
	} 
	
	@RequestMapping(value = "/memberModify")
	public String memberModify(Model model, HttpSession session) {
		
		String sessionId = (String) session.getAttribute("userId");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		memberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberModify";
	}
	
	@RequestMapping(value = "/memberModifyOk")
	public String memberModifyOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		String userPoint = request.getParameter("userPoint");
		
		String sessionId = (String) session.getAttribute("userId");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		dao.memberModify(userId, userPw, userName, userPhone, userEmail, userPoint);
		
		memberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberModifyOk";
	}
	
	
	
	@RequestMapping(value = "/memberDelete")
	public String memberDelete(Model model,HttpSession session) {
		
		String sessionId = (String) session.getAttribute("userId");
		String sessionPw = (String) session.getAttribute("userPw");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		memberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberDelete";
	}
	
	@RequestMapping(value = "/memberDeleteOk")
	public String memberDeleteOk(HttpServletRequest request, HttpSession session) {
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		
		
	
		
		return "memberDeleteOk";
	}
	
	

	
	
	
	
}

