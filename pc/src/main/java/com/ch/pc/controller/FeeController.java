package com.ch.pc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.pc.model.Fee;
import com.ch.pc.model.Member1;
import com.ch.pc.service.PcService;
	
@Controller
public class FeeController {
	@Autowired
	private PcService ps;
	
	@RequestMapping("feeInsertForm")
	public String feeInsertForm(Model model) {
		return "/fee/feeInsertForm";
	}
	
	@RequestMapping("feeInsert")
	public String feeInsert(Fee fee, Model model, HttpSession session) {
		int pcno = (Integer) session.getAttribute("pcnoSession");
		fee.setPcno(pcno);
		int result = 0;
		result = ps.feeInsert(fee);
		model.addAttribute("result", result);
		return "/fee/feeInsert";
	}
	
	@RequestMapping("feeUpdateForm")
	public String feeUpdate(Model model, HttpSession session) {
		int pcno = (Integer) session.getAttribute("pcnoSession");
		Fee fee = ps.selectFee(pcno);
		model.addAttribute("fee", fee);
		return "/fee/feeUpdateForm";
	}
	
	@RequestMapping("feeUpdate")
	public String feeUpdate(Fee fee, Model model, HttpSession session) {
		int pcno = (Integer) session.getAttribute("pcnoSession");
		fee.setPcno(pcno);
		int result = 0;
		result = ps.feeUpdate(fee);
		model.addAttribute("result", result);
		return "/fee/feeUpdate";
	}
}
