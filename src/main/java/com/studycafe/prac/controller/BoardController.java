package com.studycafe.prac.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studycafe.prac.dao.BoardDao;
import com.studycafe.prac.dao.MemberDao;
import com.studycafe.prac.dao.TodayTicketDao;
import com.studycafe.prac.dto.BoardDto;
import com.studycafe.prac.dto.Criteria;
import com.studycafe.prac.dto.PageDto;
import com.studycafe.prac.dto.memberDto;
import com.studycafe.prac.dto.seatDto;


@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/question")
	public String question(HttpSession session, Model model) {
			
		String sessionId = (String) session.getAttribute("userId");
		
		if(sessionId == null) {//로그인 상태 확인
			model.addAttribute("userId", "GUEST");
		} else {
			model.addAttribute("userId", sessionId);
		}
		
		return "question";
	}
	
	@RequestMapping(value = "/questionOk")
	public String questionOk(HttpServletRequest request) {
		
		String btitle = request.getParameter("btitle");//질문 제목
		String bcontent = request.getParameter("bcontent");//질문 내용
		String buserid = request.getParameter("buserid");//글쓴유저 아이디
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		dao.writeQuestion(btitle, bcontent, buserid);
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "list")
	public String list(Model model, Criteria cri, HttpServletRequest request) {
		
		int pageNumInt = 0;
		if(request.getParameter("pageNum") == null) {
			pageNumInt = 1;
			cri.setPageNum(pageNumInt);
			
		} else {
			pageNumInt = Integer.parseInt(request.getParameter("pageNum"));
			cri.setPageNum(pageNumInt);
		}
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		int totalRecord = dao.boardAllCount();
		
		//cri.setPageNum();
		
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount());//해당 페이지의 시작번호를 설정
		
		PageDto pageDto = new PageDto(cri, totalRecord);
		
		List<BoardDto> qboardDtos = dao.questionList(cri);
		
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("qdtos", qboardDtos);
		model.addAttribute("currPage", pageNumInt);
		
		return "questionList";
	}
	
	@RequestMapping(value = "/questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		String bnum = request.getParameter("bnum");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		BoardDto qBoardDto = dao.questionView(bnum);
		
		model.addAttribute("qdto", qBoardDto);
		model.addAttribute("buserid", qBoardDto.getBuserid());//글쓴 유저의 id값 전송
		
		return "questionView";
	}
	
	@RequestMapping(value = "/questionModify")
	public String questionModify(HttpServletRequest request, Model model) {
		
		String bnum = request.getParameter("bnum");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		BoardDto qBoardDto = dao.questionView(bnum);
		
		model.addAttribute("qdto", qBoardDto);
		
		
		return "questionModify";
	}
	
	@RequestMapping(value = "/questionModifyOk")
	public String questionModifyOk(HttpServletRequest request) {
		
		String bnum = request.getParameter("bnum");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String buserid = request.getParameter("buserid");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		dao.questionModify(bnum, btitle, bcontent, buserid);
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "/questionDelete")
	public String questionDelete(HttpServletRequest request) {
		
		String bnum= request.getParameter("bnum");
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		dao.questionDelete(bnum);
		
		return "redirect:list";
	}
	
}
