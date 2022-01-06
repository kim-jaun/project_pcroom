package com.ch.pc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PcController {

	@RequestMapping("registerForm")
	public String registerForm() {
		return "/pc/registerForm";
	}
	
	@RequestMapping("pcMainForm")
	public String pcMainForm() {
		return "/pc/pcMainForm";
	}
	
	
}
