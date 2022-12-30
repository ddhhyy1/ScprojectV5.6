package com.studycafe.prac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

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
import com.studycafe.prac.dto.memberDto;
import com.studycafe.prac.dto.seatDto;

@Controller
public class SubcriptionTicketController {

	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/SubscriptionTicketBuy")//구독이용권구매1
	public String STicketBuy(HttpServletResponse response,HttpSession session,Model model) {
		
		String sessionId = (String) session.getAttribute("userId");
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		memberDto memberdto = dao.getMemberInfo(sessionId);
		
		
		if(sessionId==null) {
		try {
			response.setContentType("text/html; charset=UTF-8");      
	        PrintWriter out;
			out = response.getWriter();
			out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
		    out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} return "ChooseTicket";
		}else {
			
			model.addAttribute("memberdto", memberdto);
		
			return "SubscriptionTicketBuy";
		}
		
	}
	@RequestMapping(value="/SubscriptionTicketView")//구독이용권좌석선택
	public String STicketView() {
		
		
		return "SubscriptionTicketView";
	}
	@RequestMapping(value="/BuySubscription")//
	public String BuySTicket(HttpServletRequest request, Model model,HttpSession session) {
			
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		String sessionId = (String) session.getAttribute("userId");
		
		String sticketName = request.getParameter("sticketName");
		
		//포인트를 고르면 해당하는 시간이 db에 저장됨
		String[] SubPrice = {"65,000","120,000","160,000","200,000"};
		String[] SubTime = {"50","100","150","200"};
		for(int i=0;i<4;i++) {
			if(SubPrice[i].equals(sticketName)) {
				dao.BuySTicket(sticketName, sessionId, SubTime[i]);
			}
		
		model.addAttribute("sticketName",sticketName);
		}
		return "SubscriptionTicketView";
	}
	@RequestMapping(value="/searchsTicketSeat")
	public String searchsTicketSeat(HttpServletRequest request, Model model,HttpSession session) {
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		String sessionId = (String) session.getAttribute("userId");
		
		
		String selectedDate = request.getParameter("selectedDate");
		int seatNo = Integer.parseInt(request.getParameter("seatNo").toString());
	
		
		model.addAttribute("selectedDate", selectedDate);
		model.addAttribute("seatNo", seatNo);
		
		return "SubscriptionTicketView2";
	
	}
	@RequestMapping(value="/SubscriptionTicketView2")
	public String SubscriptionTicketView2() {
		
		
		return "SubscriptionTicketView2";
	}
	@RequestMapping(value="/registsTicketConfirm")
	public String registsTicketConfirm(HttpServletRequest request, Model model,HttpServletResponse response,HttpSession session) {
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		String sessionId = (String) session.getAttribute("userId");
		
		int seatNo = Integer.parseInt(request.getParameter("seatNo").toString());
		
		String selectedDate = request.getParameter("selectedDate");
		String [] selectedTime = request.getParameterValues("selectedTime");
		
		
		//넘어온 체크박스값 정렬 후, 첫번째 값부터 마지막값까지 추출후 새 배열에 넣음
				Arrays.sort(selectedTime);
				int i;
				String [] selectedTimes= new String[selectedTime.length];
				for(i=0;i<selectedTime.length;i++) {	
				String number=selectedTime[i];
				selectedTimes[i]=number;
				}
				int bticketName = selectedTime.length;
				
				
					
					if(bticketName==selectedTime.length) {//체크박스의 갯수와 ticketname의 숫자를 비교해서 일치하지 않으면 뒤로돌려보냄
						String sticketName = String.valueOf(bticketName);
						dao.regist(seatNo, sessionId, sticketName, selectedDate);
							for(int n=1;n<=selectedTime.length;n++) {//ST[i]배열의 값을 각각 체크박스 갯수만큼 데이타베이스(선택시간)에 넣음 
								dao.makeReservation(seatNo, sessionId, selectedDate, selectedTimes[n-1]);
							}
							
						//방금 들어간 회원정보들을 결제 전 체크페이지에 전달	
						ArrayList<seatDto> seatDto= dao.registTodayConfirm();
						
						seatDto fseatDto = seatDto.get(0);
						
						
						int[] Times= new int[17];//8부터 24까지 문자배열생성
						for(int j=0;j<16;j++) {
						Times[j]=j+8;	
						}
						  int[] intstTimes= new int[selectedTimes.length]; //체크박스 지정된 갯수만큼의 사이즈의 배열 생성
						  for (int k = 0; k < selectedTimes.length; k++) {
					            intstTimes[k] = Integer.parseInt(selectedTimes[k]);//체크박스 값들을 정수배열로 변환
					        }
						  int[] savedTimes= new int[intstTimes.length];//체크박스의 값들을 시간으로 치환해줄 배열생성
						  for (i=0;i < intstTimes.length;i++) {
							  savedTimes[i]=Times[intstTimes[i]];//체크박스값 배열들을 시간으로 치환하여 저장
						  }
						  String startTime = String.valueOf(savedTimes[0]); //시작시간을 저장
						  int lastindex = savedTimes[savedTimes.length-1];
						  lastindex = lastindex + 1 ;
						  String endTime = String.valueOf(lastindex); //종료시간 저장
						  
						  model.addAttribute("startTime",startTime);
						  model.addAttribute("endTime",endTime);
						  model.addAttribute("fseatDto", fseatDto);
						
						return "registsTicketConfirm";
					}else {
					try {
						response.setContentType("text/html; charset=UTF-8");      
				        PrintWriter out;
						out = response.getWriter();
						out.println("<script>alert('이용시간과 선택한 지정시간이 일치하지 않습니다.'); history.go(-1);</script>");
					    out.flush();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					return "SubscriptionTicketView2";
					}
		
		
	}
	
	
}
