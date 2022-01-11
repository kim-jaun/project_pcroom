package com.ch.pc.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pc.model.Board_reply;
import com.ch.pc.model.Member1;
import com.ch.pc.service.Board_replyService;
import com.ch.pc.service.MemberService;
import com.ch.pc.service.Reply_likesService;

@Controller
public class ReplyController {
	@Autowired
	private MemberService ms;
	@Autowired
	private Board_replyService brs;
	@Autowired
	private Reply_likesService rls;

	@RequestMapping("rInsert")
	public String rInsert(Board_reply board_reply, HttpSession session, Model model) {
		Member1 member = (Member1) session.getAttribute("memberSession");
		brs.insert(board_reply);
		model.addAttribute("member", member);
		return "redirect:/pc/replyList/pcno/"+board_reply.getPcno()+"/bno/"+board_reply.getBno();
	}

	@RequestMapping("replyList")
	public String replyList(Board_reply board_reply, String pageNum, Model model, HttpSession session) {
		Member1 memberSession = (Member1) session.getAttribute("memberSession");
		List<Board_reply> list = brs.list(board_reply.getPcno(), board_reply.getBno());
		for (Board_reply reply : list) {
			Member1 member1 = ms.selectMno(reply.getMno());
			reply.setNick_name(member1.getNick_name());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd E a HH:mm:ss");
			String reg_date = simpleDateFormat.format(reply.getReg_date());
			model.addAttribute("reg_date", reg_date);
			/*-----------댓글 추천유무 구현-----------------*/
//
//			int rno = reply.getRno(); int reply_likes = rls.select(session.getId(), rno); 
//			if(reply_likes > 0) { // 좋아요 한 게시글이면 
//				reply.setLikesConfirm(1);
//
//			} else if (reply_likes == 0) { // 좋아요 한 게시글이 아니면 
//				reply.setLikesConfirm(0);
//			}
//		}
//			 
			/*-----------댓글 추천유무 구현 끝-----------------*/
		}
		model.addAttribute("memberSession", memberSession);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", list);
		return "/pc/replyList";
	}
}
