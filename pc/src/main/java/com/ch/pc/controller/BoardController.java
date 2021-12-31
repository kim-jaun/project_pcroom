package com.ch.pc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pc.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;

	@RequestMapping("map")
	public String map() {
		return "map";
	}

}
