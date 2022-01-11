package com.ch.pc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.model.Seat;
import com.ch.pc.service.PcService;

@Controller
public class PcController {
	@Autowired
	private PcService ps;
	
	@RequestMapping("registerForm")
	public String registerForm() {
		return "/pc/registerForm";
	}
	@RequestMapping("register")
	public String register(Pc pc, Model model, HttpSession session, MultipartHttpServletRequest mr)throws IOException {
		int result;
		pc.setPcno(ps.givePcno()); // 일련번호 부여
		List<Pc> pcbnm = ps.selectPcbnm(pc.getPcbusinessnum()); // 중복된 사업자번호 등록 방지
		List<Pc> pcpno = ps.selectPcpno(pc.getPcpno()); // 중복된 전화번호 등록 방지
		String real = 
				session.getServletContext().getRealPath("/resources/upload");
		if (pcbnm.isEmpty() && pcpno.isEmpty()) {			
			List<MultipartFile> list = mr.getFiles("pcimage");
			List<Pcimage> images = new ArrayList<Pcimage>();
			for (MultipartFile mf : list) {
				Pcimage pi = new Pcimage();
				String fileName = mf.getOriginalFilename();
				pi.setPcno(pc.getPcno()); 
				pi.setImagename(fileName);
				images.add(pi);
				FileOutputStream fos = 
						new FileOutputStream(new File(real+"/"+fileName));
				fos.write(mf.getBytes()); fos.close();
				pc.setImagename(fileName);
			}
			result = ps.insertPc(pc);
			System.out.println(result);
			ps.insertPcimage(images);	
		} else
			result = 0;

		model.addAttribute("result", result);

		return "/pc/register";
	}	
	@RequestMapping("pcMainForm")
	public String pcMainForm(int pcno, Model model, HttpSession session) {
		Pc pc = ps.select(pcno);
		List<Pcimage> list = ps.listPhoto(pcno);
		model.addAttribute("pc", pc);
		model.addAttribute("list", list);
		return "/pc/pcMainForm";
	}
	@RequestMapping("pcDetailForm")
	public String pcDetailForm(int pcno, Model model) {
		Pc pc = ps.select(pcno);
		List<Pcimage> list = ps.listPhoto(pcno);
		model.addAttribute("pc", pc);
		model.addAttribute("list", list);
		return "/main/pcDetailForm";
	}

	@RequestMapping("reservation")
	public String reservation(int pcno, Model model) {
		model.addAttribute("pcno", pcno);
		return "/pc/reservation";
	}
	@RequestMapping("seatForm")
	public String seatForm(int pcno, Model model) {
		model.addAttribute("pcno", pcno);
		Pc pc = ps.select(pcno);
		model.addAttribute("pc", pc);
		return "/pc/seatForm";
	}
	@RequestMapping("seatSetting")
	public String seatSetting(Seat seat, Model model) {
		int result = 0;
		if (seat.getSeatposition() == null) {
			result = 0;
		} else {			
			result = ps.insertSeat(seat);
		}
		int pcno = seat.getPcno();
		model.addAttribute("result", result);
		model.addAttribute("pcno", pcno);
		return "/pc/seatSetting";
	}
	
}
