package com.studycafe.prac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studycafe.prac.dao.BoardDao;
import com.studycafe.prac.dao.MemberDao;
import com.studycafe.prac.dao.TodayTicketDao;
import com.studycafe.prac.dto.Criteria;
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
	public String index(Model model,HttpSession session,HttpServletRequest request, Criteria cri) {
		
		String sessionId = (String) session.getAttribute("userId");
		TodayTicketDao tdao = sqlSession.getMapper(TodayTicketDao.class);
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		
		
		//로그인시 지난 예약날짜의 예약데이터들 과거예약테이블로 옮기고 삭제 후 개인정보 갱신
		List<seatDto> sDto= tdao.getAllSeatInfo(cri);
		
		LocalDate now = LocalDate.now();
		String strNow = now.toString(); 
		String today = strNow.substring(0,4)+strNow.substring(5,7)+strNow.substring(8,10);
		int nToday = Integer.parseInt(today);//오늘날짜 구하기
		 
			//새 곳에 담을 리스트들 생성
		List<Integer> selectedDate = new ArrayList<Integer>();
		List<Integer> reservNo = new ArrayList<Integer>();
		List<String> userIds= new ArrayList<String>(); 
			//반복문으로 각 리스트에 필요한 데이터들 인덱스 맞춰 추출
		for(int i=0;i<sDto.size();i++ ) {
			selectedDate.add(Integer.parseInt(sDto.get(i).getSelectedDate()));
			reservNo.add(sDto.get(i).getTempUsingNo());
			userIds.add(sDto.get(i).getUserId());
			if(selectedDate.get(i) < nToday) {//만약 불러온 날짜들이 오늘보다 이전 날짜들이면 기능	
				memberDto mDto = mDao.getMemberInfo(userIds.get(i));
				int uTicket = Integer.parseInt(mDto.getUsingTicket());
				tdao.transferData(reservNo.get(i));//현재 예약 테이블에서 과거 예약 테이블로 옮김
				tdao.deleteTransferedData(reservNo.get(i));//현재 예약테이블에 과거 예약들은 삭제
					if(uTicket<50) { //50시간 이하의 당일권 유저들만 0시간으로 돌려보냄
						String zero="0";
						tdao.updateUticket(userIds.get(i),zero);
						
					}

			}
		}
		
		
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
			session.setAttribute("userPw", userPw);
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
	public String memberJoin(HttpSession session) {
		
		
	    
		
		return "memberJoin";
	}
	
	@RequestMapping(value = "/JoinOk")
	public String JoinOk(HttpServletRequest request, HttpSession session, Model model,HttpServletResponse response) {
		
	
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		
		String userId = request.getParameter("userId");
		String uPw = request.getParameter("userPw");
		String uName = request.getParameter("userName");
		String uPhone = request.getParameter("userPhone");
		String uEmail = request.getParameter("userEmail");
		String uPoint = request.getParameter("userPoint");
		String uTicket = request.getParameter("usingTicket");
		System.out.println(userId);

		int userIdCount = dao.getUserIdCount(userId);
		System.out.println(userIdCount);

		if(userIdCount == 0) {
			
			int joinFlag =dao.joinMember(userId, uPw, uName, uPhone ,uEmail, uPoint,uTicket);
			
			if(joinFlag == 1) {//회원가입 성공시 바로 로그인 진행
				session.setAttribute("userId", userId);
				session.setAttribute("uName", uName);
				
				model.addAttribute("uName", uName);
				model.addAttribute("uId", userId);
				System.out.println("성공!");
			}
		}else {
			
			try {
				response.setContentType("text/html; charset=UTF-8");      
		        PrintWriter out;
				out = response.getWriter();
				out.println("<script>alert('중복된 아이디입니다. 다른 아이디로 설정해주세요!'); history.go(-1);</script>");
			    out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		
		
		
			
		
		return "redirect:index";
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
	public String memberDelete(HttpServletRequest request, HttpSession session) {
		
		return "memberDelete";
	
	}
	
	@RequestMapping(value = "/memberDeleteOk")
	public String memberDeleteOk(HttpServletRequest request, HttpSession session, HttpServletResponse response,Model model ) {
		
		String userId= request.getParameter("userId");
		String userPw= request.getParameter("userPw");
		
		
		String sessionId = (String) session.getAttribute("userId");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		memberDto mDto = dao.getMemberInfo(sessionId);
		String sessionPw = mDto.getUserPw();
		
		
		
		if(!(userPw.equals(sessionPw))) {//비밀번호 일치 여부
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else {
			
			dao.memberDelete(userPw);//회원 정보 삭제
			session.invalidate();
			
		}
		
		return "redirect:index";
	}
	
	@RequestMapping(value="/CheckId")
	public String CheckId() {
		
		
		
		
		return "CheckId";
	}
}
	
