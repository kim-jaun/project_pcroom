package com.ch.pc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
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
import com.ch.pc.model.Seat;
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
		List<Pcimage> photolist = ps.listPhoto(pc2.getPcno());
		pc2.setSearchKey(pc.getSearchKey());
		pc2.setSearchValue(pc.getSearchValue());		
		
		model.addAttribute("pc", pc2);
		model.addAttribute("photolist", photolist);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("id", id);
		return "/pc/pcMainForm";
	}

	@RequestMapping("reservationForm")
	public String reservation(Pc pc, Model model) {
		Pc pc2 = ps.select(pc.getPcno());
		String slist = ps.listSeat(pc.getPcno());
		String[] seatlists = slist.split(",");
		Calendar now_time = Calendar.getInstance();
		
		// now_time을 현재시간 +1로 설정
		now_time.set(Calendar.HOUR_OF_DAY, now_time.get(Calendar.HOUR_OF_DAY)+1);
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH");
		SimpleDateFormat sdf2 = new SimpleDateFormat("mm");
		Date now_time1 = now_time.getTime();
		String min = sdf2.format(now_time1);
		String hours = sdf.format(now_time1);
		int hoursI = Integer.parseInt(hours);
		int minI = Integer.parseInt(min);
		int AA = 0;
		int BB = 0;
		
		if (minI < 30) {
			hoursI -= 1;
			minI = 30;
			AA = 1;
		} else {
			minI = 0;
			BB = 1;
		}
		
		model.addAttribute("AA", AA);
		model.addAttribute("BB", BB);
		model.addAttribute("now_hour", hoursI);
		model.addAttribute("now_min", minI);
		model.addAttribute("seatlists", Arrays.toString(seatlists));
		model.addAttribute("pc", pc2);
		return "/pc/reservationForm";
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
