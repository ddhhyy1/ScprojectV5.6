package com.studycafe.prac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.studycafe.prac.dto.ScreservDto;
import com.studycafe.prac.dto.SubscriptionTicketDto;
import com.studycafe.prac.dto.memberDto;
import com.studycafe.prac.dto.seatDto;

@Controller
public class ReservInfoController {

	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/ReservInfoList")
	public String ReservInfoList(Model model,HttpSession session) {
	
		
		String sessionId = (String) session.getAttribute("userId");
		TodayTicketDao tdao = sqlSession.getMapper(TodayTicketDao.class);
		
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		SubscriptionTicketDto stDto = tdao.getSTicketInfo(sessionId);
		List<seatDto> AllReservInfo= tdao.getAllReservInfo(sessionId);
		
		
		memberDto memberDto = mdao.getMemberInfo(sessionId);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("stDto", stDto);
		model.addAttribute("AllReservInfo", AllReservInfo);
		
		
		return "Ticket/ReservInfoList";
		
	}
	@RequestMapping(value="/ReservInfoView")
	public String ReservInfoView(Model model,HttpSession session,HttpServletRequest request) {

		
		
		String sessionId = (String) session.getAttribute("userId");
		String tempNo = request.getParameter("tempUsingNo");
		
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		TodayTicketDao tdao = sqlSession.getMapper(TodayTicketDao.class);
		
		seatDto sDto = tdao.getReservInfo(tempNo);

		String selectedDate = sDto.getSelectedDate();
		
		String year= selectedDate.substring(0, 4);
		String month= selectedDate.substring(4, 6);
		String day= selectedDate.substring(6, 8);
		
		model.addAttribute("selectedDate",selectedDate);
		model.addAttribute("day",day);
		model.addAttribute("month",month);
		model.addAttribute("year",year);
		model.addAttribute("sDto",sDto);
		
			return "Ticket/ReservInfoView";
		
}	
	@RequestMapping(value="/cancelReserv")
	public String cancelReserv2(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		String sessionId = (String) session.getAttribute("userId");
		String tempNo = request.getParameter("tempUsingNo");
		String seatNo = request.getParameter("seatNo");
		String selectedDate = request.getParameter("selectedDate");
		
		TodayTicketDao tdao = sqlSession.getMapper(TodayTicketDao.class);
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		seatDto sDto = tdao.getReservInfo(tempNo);
		SubscriptionTicketDto subscrDto= tdao.getSTicketInfo(sessionId);
		
		memberDto memberDto = mdao.getMemberInfo(sessionId);
		int userPoint = Integer.parseInt(memberDto.getUserPoint().toString());//기존 유저 포인트를 계산해주기 위해 int값변환
		
		int usingTicket = Integer.parseInt(memberDto.getUsingTicket().toString());//사용하고 있던 당일권 숫자가져옴.
		int intUsingTicket = usingTicket;//불러온 당일권 값을 0으로 바꾸기전에 사용하기 위해 다른 이름으로 저장
		String strUsingTicket = Integer.toString(usingTicket);// 당일권값을 비교하기 위해 str로 변환
		usingTicket = 0; //예약이 취소되면 이용권은 0으로 변환
		String zeroUsingTicket = Integer.toString(usingTicket); //0으로 변환된 int를 다시 str로 변환하여 저장
		String salesNo = sDto.getSalesNo();//매출테이블 번호 뽑아오기
		
		int ticketName = Integer.parseInt(sDto.getTicketName().toString());
		
		
		
			if(intUsingTicket>0 && intUsingTicket<50) { //당일권 유저
				
		
			//당일권의 환불할 포인트 계산하기		
				int t;
				String[] TodayPrice = {"2,000","3,000","5,000","6,000","7,000"};
				String[] TodayTime = {"1","2","4","6","8"};
				for(t=0;t<5;t++) {
					if(TodayTime[t].equals(strUsingTicket)) {//str로 변환한 당일권값이 TodayTime의 인덱스 값과 일치할때만 포인트 저장
						String returnPoint = TodayPrice[t];
						String rPoint = returnPoint.replaceAll(",", "");//저장된 포인트의 , 쉼표 다 제거
						int intRPoint = Integer.parseInt(rPoint); //계산을 위해 int값으로 변환
						String finalUserRPoint = Integer.toString(userPoint+intRPoint);//환불을 위해 기존 포인트에 환불될 포인트 더 한후 str값으로변환
						tdao.returnUserPointTicket(sessionId, finalUserRPoint ,zeroUsingTicket);//포인트와 티켓값 업데이트 해줌
					}
				}
				tdao.cancelReservSaleTbl(salesNo); //매출 테이블 매출 제거
		
				tdao.cancelReservSeatTbl(tempNo); //전체적좌석 테이블 정보 제거
				tdao.cancelReservResvTbl(sessionId, seatNo, selectedDate); //예약된 시간대 및 좌석 제거
				
				try {
           			response.setContentType("text/html; charset=UTF-8");      
           	        PrintWriter out;
           			out = response.getWriter();
           			out.println("<script>alert('취소 완료!');window.location.href = 'ReservInfoList'</script>");
           		    out.flush();
           		} catch (IOException e) {
           			// TODO Auto-generated catch block
           			e.printStackTrace();
           		}
				
			}else {		
				
				int remainTime = Integer.parseInt(subscrDto.getSremainTime().toString());
				int returnedRemainTime= remainTime + ticketName;
				String rrTime = Integer.toString(returnedRemainTime);
				
				tdao.cancelReservSeatTbl(tempNo); //전체적좌석 테이블 정보 제거
				tdao.cancelReservResvTbl(sessionId, seatNo, selectedDate); //예약된 시간대 및 좌석 제거
				tdao.returnRemainTime(sessionId, rrTime);
			
				try {
           			response.setContentType("text/html; charset=UTF-8");      
           	        PrintWriter out;
           			out = response.getWriter();
           			out.println("<script>alert('취소 완료!');window.location.href = 'ReservInfoList'</script>");
           		    out.flush();
           		} catch (IOException e) {
           			// TODO Auto-generated catch block
           			e.printStackTrace();
           		}
			}
		
		return "redirect:ReservInfoList";
	}
	

	@RequestMapping(value = "changeDateSeat")
	public String changeDateSeat(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) {
		
		
		TodayTicketDao tdao = sqlSession.getMapper(TodayTicketDao.class);
		
		String tempNo = request.getParameter("tempUsingNo");
		
		seatDto sDto = tdao.getReservInfo(tempNo);
		
		String selectedDate = sDto.getSelectedDate();
		
		String year= selectedDate.substring(0, 4);
		String month= selectedDate.substring(4, 6);
		String day= selectedDate.substring(6, 8);
		
		model.addAttribute("day",day);
		model.addAttribute("month",month);
		model.addAttribute("year",year);
		model.addAttribute("sDto",sDto);
		model.addAttribute("tempNo",tempNo);
		
		return "Ticket/changeDateSeat";
	}
	
	@RequestMapping(value="/changeTime")
	public String changeTime(HttpServletRequest request, Model model) {
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		
		String userId = request.getParameter("userId");
		String selectedDate = request.getParameter("selectedDate");
		int seatNo = Integer.parseInt(request.getParameter("seatNo").toString());
		String tempNo = request.getParameter("tempNo");
		System.out.println(tempNo);
		
		seatDto sDto = dao.getReservInfo(tempNo);
		int intSTime = Integer.parseInt(sDto.getStartTime().toString());
		int intETime = Integer.parseInt(sDto.getEndTime().toString());
		int totalHour = intETime - intSTime;
		
		//날짜와 좌석을 기반으로 정보를 모두 가져옴
		List<ScreservDto> reservInfo = dao.searchReservation(seatNo, selectedDate);
		
		//받아온 db정보들을 String 리스트에 저장
		List<String> intselectedTime = new ArrayList<String>();
		for(int i=0;i<reservInfo.size();i++) {
			String times = reservInfo.get(i).getSelectedTime();//reservinfo에서 원하는 정보인 selectedTime만 저장
			intselectedTime.add(times); //새 String 리스트에 하나씩 저장
		}
		
	
		//인트 리스트로 변환
		int n,f;
		 List<Integer> IntDBselectedTimes = new ArrayList<Integer>();
	        for (n = 0; n < intselectedTime.size(); n++) {
	        	IntDBselectedTimes.add(Integer.parseInt(intselectedTime.get(n)));
	        }
	        
	    List<String> OccupiedTimes = new ArrayList<String>();
	    for(f = 1; f<=17;f++) {
	    	if(IntDBselectedTimes.contains(f)) {
	    		OccupiedTimes.add("1");
	    	}else {
	    		OccupiedTimes.add("0");
	    	}
	    }
	    
	
		String strSeatNo = String.valueOf(seatNo);	
		model.addAttribute("userId", userId);
		model.addAttribute("selectedDate", selectedDate);
		model.addAttribute("seatNo", strSeatNo);
		model.addAttribute("opTimes", OccupiedTimes);
		model.addAttribute("sTime", intSTime);
		model.addAttribute("eTime", intETime);
		model.addAttribute("tHour", totalHour);
		model.addAttribute("tempNo", tempNo);
		
		return "Ticket/changeTime";
	}
	
	@RequestMapping(value="/changeConfirm")
	public String changeConfirm(HttpServletRequest request,HttpServletResponse response,Model model) {
			
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		
		String seatNo = request.getParameter("seatNo");
		String ticketName = request.getParameter("ticketName");
		String selectedDate = request.getParameter("selectedDate");
		String [] selectedTime = request.getParameterValues("selectedTime");//체크박스값 String 배열로 저장
		String tempNo = request.getParameter("tempNo");
		
		seatDto sDto = dao.getReservInfo(tempNo);
		int intSTime = Integer.parseInt(sDto.getStartTime().toString());
		int intETime = Integer.parseInt(sDto.getEndTime().toString());
		int totalHour = intETime - intSTime;
		
		//넘어온 체크박스값 정렬 후, 첫번째 값부터 마지막값까지 추출후 새 배열에 넣음
		Arrays.sort(selectedTime);
		int i;
		String [] selectedTimes= new String[selectedTime.length];
		for(i=0;i<selectedTime.length;i++) {	
		String number=selectedTime[i];
		selectedTimes[i]=number;
		}
		
		int intticketName= Integer.parseInt(ticketName);//ticketname을 int로 변환 체크박스 갯수를 알아내기위해
			
		if(intticketName==selectedTime.length) {//체크박스의 갯수와 ticketname의 숫자를 비교해서 일치하지 않으면 뒤로돌려보냄
				
				//-----------------방금 들어간 회원정보들을 결제 전 체크페이지에 전달	---------------------------
//				ArrayList<seatDto> seatDto= dao.registTodayConfirm();
//				
//				seatDto fseatDto = seatDto.get(0);
//				
				int t;
				String[] TodayPrice = {"2,000","3,000","5,000","6,000","7,000"};
				String[] TodayTime = {"1","2","4","6","8"};
				for(t=0;t<5;t++) {
					if(TodayTime[t].equals(ticketName)) {
						
						model.addAttribute("PayingPoint",TodayPrice[t]);//지불할 포인트 계산
					}
				}
				//-------시작시간 종료시간 뽑아내기---------
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
				  
				  model.addAttribute("selectedDate",selectedDate);
				  model.addAttribute("startTime",startTime);
				  model.addAttribute("endTime",endTime);
				  model.addAttribute("seatNo",seatNo );
				  model.addAttribute("ticketName",ticketName);
				  model.addAttribute("selectedTime",selectedTime);
				  model.addAttribute("sDto",sDto);
				  
				//-----------------방금 들어간 회원정보들을 결제 전 체크페이지에 전달 끝	---------------------------
				  return "Ticket/changeConfirm";
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
			
			return "Ticket/changeTime";
			}
		

	}
}
