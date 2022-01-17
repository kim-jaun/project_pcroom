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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ch.pc.model.Member1;
import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.service.BookmarkService;
import com.ch.pc.service.PcService;

@Controller
public class PcController {
	@Autowired
	private PcService ps;
	
	@Autowired
	private BookmarkService bs;
	
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
	public String pcMainForm(Pc pc, Model model, HttpSession session, String pageNum) {
		Member1 member1 = (Member1) session.getAttribute("memberSession");
		String id = member1.getId();
		Pc pc2 = ps.select(pc.getPcno());
		List<Pcimage> list = ps.listPhoto(pc2.getPcno());
		pc2.setSearchKey(pc.getSearchKey());
		pc2.setSearchValue(pc.getSearchValue());		
		
		model.addAttribute("pc", pc2);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("id", id);
		return "/pc/pcMainForm";
	}

	@RequestMapping("pcDetailForm")
	public String pcDetailForm(int pcno, Model model, HttpSession session) {
		Pc pc = ps.select(pcno);
		List<Pcimage> list = ps.listPhoto(pcno);
		
		//이 아이디가 북마크 했는지 안했는지 구분
		String imgSrc = "";
		Member1 memberSession = (Member1) session.getAttribute("memberSession");
		if (memberSession != null) {
			int mno = memberSession.getMno(); 
			int bookmark = bs.select(mno, pcno);
			if (bookmark > 0) { // 북마크 한 약품이면
				imgSrc = "/pc/resources/images/bookmark_on.png";

			} else if (bookmark == 0) { // 북마크 한 약품이 아니면
				imgSrc = "/pc/resources/images/bookmark_off.png";
			}
		}
		
		model.addAttribute("imgSrc", imgSrc);
		model.addAttribute("pc", pc);
		model.addAttribute("list", list);
		return "/main/pcDetailForm";
	}

	@RequestMapping("reservation")
	public String reservation() {
		return "/pc/reservation";
	}

	@RequestMapping("seatForm")
	public String seatForm() {
		return "/pc/seatForm";
	}

	@RequestMapping("seatSetting")
	public String seatSetting() {

		return "/pc/seatSetting";
	}

	

	@RequestMapping(value = "bookmark", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String bookmark(int pcno, Model model, HttpSession session) {
		
		Pc pc = ps.select(pcno);
		Member1 memberSession = (Member1) session.getAttribute("memberSession");
		int mno = memberSession.getMno();
		int bookmark = bs.select(mno, pcno);
		
		String imgSrc = "";
		if (bookmark > 0) { // 북마크한 약품이면
			bs.delete(mno, pcno); // bookmark 테이블에서 데이터 삭제
			imgSrc = "/pc/resources/images/bookmark_off.png";

		} else if (bookmark == 0) { // 북마크한 약품이 아니면
			bs.insert(mno, pcno); // bookmark 테이블에 데이터 추가
			imgSrc = "/pc/resources/images/bookmark_on.png";
		}
		return imgSrc;
	}
}
