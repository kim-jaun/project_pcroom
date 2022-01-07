package com.ch.pc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pc.model.Location;

@Controller
public class MainController {

	
	@SuppressWarnings("null")
	@RequestMapping("main")
	public String main(Location location, Model model) {
		
		if(location.getSido() == null) {
			location.setSido("서울특별시");
			location.setSigugun("이대역");
			System.out.println(location);
		}
		
		model.addAttribute("location", location);
		return "/main/main";
	}
	
	@RequestMapping("sessionChk")
	public String sessionChk() {
		return "/main/sessionChk";
	}

	
}
