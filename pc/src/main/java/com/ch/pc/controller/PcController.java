package com.ch.pc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ch.pc.model.Bookmark;
import com.ch.pc.model.Member1;
import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.model.Seat;
import com.ch.pc.service.BookmarkService;
import com.ch.pc.service.PageBean;
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
		Member1 memberSession = (Member1)session.getAttribute("memberSession");
		
		pc.setPcno(ps.givePcno()); // 일련번호 부여
		List<Pc> pcbnm = ps.selectPcbnm(pc.getPcbusinessnum()); // 중복된 사업자번호 등록 방지
		List<Pc> pcpno = ps.selectPcpno(pc.getPcpno()); // 중복된 전화번호 등록 방지
		String real = session.getServletContext().getRealPath("/resources/upload");
		if (pcbnm.isEmpty() && pcpno.isEmpty()) {			
			List<MultipartFile> list = mr.getFiles("pcimage");
			List<Pcimage> images = new ArrayList<Pcimage>();
			for (MultipartFile mf : list) {
				Pcimage pi = new Pcimage();
				String fileName = mf.getOriginalFilename();
				pi.setPcno(pc.getPcno()); 
				pi.setImagename(fileName);
				images.add(pi);
				FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
				fos.write(mf.getBytes()); 
				fos.close();
				pc.setImagename(fileName);
			}
			pc.setMno(memberSession.getMno());
			result = ps.insertPc(pc);
			ps.insertPcimage(images);
			// 가맹점 문의 후 바로 헤더에서 승인이 안된걸 확인하기 위해
			pc = ps.selectMno(memberSession.getMno());
			if(pc == null) {
				memberSession.setPermitConfirm(-1);
			}else if(pc.getPermit().equals("y")) {
				memberSession.setPermitConfirm(1);
			}else if(pc.getPermit().equals("n")) {
				memberSession.setPermitConfirm(0);
			}
			session.setAttribute("memberSession", memberSession);
			
		} else result = 0;

		model.addAttribute("result", result);

		return "/pc/register";
	}
	@RequestMapping("pcMainForm")
	public String pcMainForm(int pcno, Model model, HttpSession session, String pageNum) {
		String imgSrc = "";
		Member1 memberSession = (Member1) session.getAttribute("memberSession");
		
		if (memberSession != null) {
			int mno = memberSession.getMno(); 
			int bookmarkConfirm = bs.select(mno, pcno);
			if (bookmarkConfirm > 0) { // 북마크 한 약품이면
				imgSrc = "/pc/resources/images/bookmark_on.png";

			} else if (bookmarkConfirm == 0) { // 북마크 한 약품이 아니면
				imgSrc = "/pc/resources/images/bookmark_off.png";
			}
		}
		String id = memberSession.getId();
		Pc pc = ps.select(pcno);
		List<Pcimage> photolist = ps.listPhoto(pcno);
		pc.setSearchKey(pc.getSearchKey());
		pc.setSearchValue(pc.getSearchValue());		
		String slist = ps.listSeat(pcno);
		String[] seatlists = null;
		if(slist != null) {
			seatlists = slist.split(",");
			}
		session.setAttribute("pcnoSession", pcno);
		model.addAttribute("imgSrc", imgSrc);
		model.addAttribute("seatlists", Arrays.toString(seatlists));
		model.addAttribute("pc", pc);
		model.addAttribute("photolist", photolist);
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
			if (bookmark > 0) { // 북마크 한 pc방이면이면
				imgSrc = "/pc/resources/images/bookmark_on.png";

			} else if (bookmark == 0) { // 북마크 한 pc방이 아니면
				imgSrc = "/pc/resources/images/bookmark_off.png";
			}
		}
		
		model.addAttribute("imgSrc", imgSrc);
		model.addAttribute("pc", pc);
		model.addAttribute("list", list);
		return "/main/pcDetailForm";
	}

	@RequestMapping("seatForm")
	public String seatForm(int pcno, Model model) {
		model.addAttribute("pcno", pcno);
		Pc pc = ps.select(pcno);
		model.addAttribute("pc", pc);
		return "/pc/seatForm";
	}
	@RequestMapping("seatSetting")
	public String seatSetting(Pc pc, Seat seat, Model model) {
		int result = 0;
		int pcno = seat.getPcno();
		int seatform = ps.updateSeatform(pc);
		Seat s1 = ps.selectseat(pcno);
		if (seat.getSeatposition() == null) {
			result = 0;
		} else if(s1 == null){			
			result = ps.insertSeat(seat);
		} else {
			result = ps.updateSeat(seat);
		}
		model.addAttribute("result", result);
		model.addAttribute("pcno", pcno);
		return "/pc/seatSetting";
	}
	
	@RequestMapping("reservation")
	public String reservation(Model model) {
		return "/pc/reservation";
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
	
	@RequestMapping("mybookmark")
	public String mybookmark(Bookmark bookmark, Pc pc, Model model, HttpSession session, String pageNum) {
		Member1 memberSession = (Member1)session.getAttribute("memberSession");
		int mno = memberSession.getMno();
		int  rowPerPage = 4;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum); 
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;	
		int total = bs.getTotalMybookmark(mno);
		List<Bookmark> list = bs.mybookmarkList(mno, startRow, endRow);
		System.out.println(list);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		
		model.addAttribute("pb", pb);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return "/member/mybookmark";
	}
	@RequestMapping("mypcUpdateForm")
	public String mypcUpdateForm(HttpSession session, Model model) {
		Member1 memberSession = (Member1)session.getAttribute("memberSession");
		int mno = memberSession.getMno();
		Pc pc = ps.selectMno(mno);
		model.addAttribute("mno", mno);
		model.addAttribute("pc", pc);
		return "/pc/mypcUpdateForm";
	}
	@RequestMapping("mypcUpdate")
	public String mypcUpdate(HttpSession session, Model model, Pc pc, MultipartHttpServletRequest mhr) throws IOException {
		int result = 0;
		String real=session.getServletContext().getRealPath("/resources/upload");
		// 파일 여러개를 저장할 list만들고 pcimage를 생성해서 하나씩 저장
		List<MultipartFile> list = mhr.getFiles("pcimage");
		// list의 사진을 한장씩 뽑아서 images에 저장
		List<Pcimage> images = new ArrayList<Pcimage>();
		for (MultipartFile mf : list) {
			Pcimage pi = new Pcimage();
			String fileName = mf.getOriginalFilename();
			pi.setPcno(pc.getPcno()); 
			pi.setImagename(fileName);
			images.add(pi);
			FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
			fos.write(mf.getBytes()); 
			fos.close();
		}
		result = ps.updatePc(pc);
		ps.deletePcimage(images);
		ps.insertPcimage(images);
		model.addAttribute("result", result);
		return "/pc/mypcUpdate";
	}
}
