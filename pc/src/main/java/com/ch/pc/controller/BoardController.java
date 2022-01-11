package com.ch.pc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pc.model.Board;
import com.ch.pc.model.Board_reply;
import com.ch.pc.model.Member1;
import com.ch.pc.service.BoardService;
import com.ch.pc.service.Board_replyService;
import com.ch.pc.service.MemberService;
import com.ch.pc.service.PageBean;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private MemberService ms;
	@Autowired
	private Board_replyService brs;
	
	@RequestMapping("boardList")
	public String boardList(Board board, String pageNum, Model model) {
		int  rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getTotal();
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Board> list = bs.list(startRow, endRow);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		
		for(Board board1:list) {
			Member1 member1 = ms.selectMno(board1.getMno());
			if(member1 != null) {
				board1.setNick_name(member1.getNick_name());
			}
		}		
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);		
		return "/pc/boardList";
	}
	@RequestMapping("content")
	public String content(Board board, String pageNum, Model model, HttpSession session) {
		bs.updateRead_cnt(board.getPcno(), board.getBno());      // 조회수 증가
		Board board2 = bs.select(board.getPcno(), board.getBno());
//		Member1 member1 = ms.selectMno(board2.getMno());
//		board2.setNick_name(member1.getNick_name());
		Member1 memberSession = (Member1)session.getAttribute("memberSession");
		board2.setNick_name(memberSession.getNick_name());
		
		model.addAttribute("memberSession", memberSession);
		model.addAttribute("board", board2);
		model.addAttribute("pageNum", pageNum);
		return "/pc/content";
	}
	@RequestMapping("insertForm")
	public String insertForm(Board board, String pageNum, Model model) {	
		model.addAttribute("board", board);		
		model.addAttribute("pageNum", pageNum);
		return "/pc/insertForm";
	}
	@RequestMapping("insert")
	public String insert(Board board, String pageNum, Model model, HttpSession session) {
		int result = 0;
		Member1 member1 = (Member1)session.getAttribute("memberSession");
		int mno = member1.getMno();
		board.setMno(mno);
		result = bs.insert(board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/pc/insert";
	}
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(Board board, String pageNum, Model model) {
		Board board2 = bs.select(board.getPcno(), board.getBno());
		Member1 member1 = ms.selectMno(board2.getMno());
		board2.setNick_name(member1.getNick_name());
		
		model.addAttribute("board", board2);
		model.addAttribute("pageNum", pageNum);
		return "/pc/boardUpdateForm";
	}
	@RequestMapping("boardUpdate")
	public String boardUpdate(Board board, String pageNum, Model model) {
		int result = 0;
		result = bs.update(board); 
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/pc/boardUpdate";
	}
	@RequestMapping("boardDelete")
	public String boardDelete(Board board, String pageNum, Model model) {
		int result = 0;
		result = bs.delete(board.getPcno(), board.getBno());
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/pc/boardDelete";
	}

}
