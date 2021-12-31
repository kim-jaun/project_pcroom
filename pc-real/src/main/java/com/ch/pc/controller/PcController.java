package com.ch.pc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pc.service.BoardService;

@Controller
public class PcController {
	@Autowired
	private BoardService bs;

	@RequestMapping("main")
	public String main() {
		return "/main/main";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	
	@RequestMapping("registerForm")
	public String registerForm() {
		return "/pc/registerForm";
	}
	
	@RequestMapping("pcMainForm")
	public String pcMainForm() {
		return "/pc/pcMainForm";
	}
	
	
}
