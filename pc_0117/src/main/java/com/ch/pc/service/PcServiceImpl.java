package com.ch.pc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pc.dao.PcDao;
import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;

@Service
public class PcServiceImpl implements PcService {	
	@Autowired
	private PcDao pd;
	
	public List<Pc> selectPcbnm(String pcbusinessnum) {
		return pd.selectPcbnm(pcbusinessnum);
	}
	public List<Pc> selectPcpno(String pcpno) {
		return pd.selectPcpno(pcpno);
	}
	public int insertPc(Pc pc) {
		return pd.insertPc(pc);
	}
	public int givePcno() {
		return pd.givePcno();
	}
	public void insertPcimage(List<Pcimage> images) {
		for(Pcimage pi : images) {
			pd.insertPi(pi);
		}
	}
	public Pc select(int pcno) {
		return pd.select(pcno);
	}
	public List<Pcimage> listPhoto(int pcno) {
		return pd.listPhoto(pcno);
	}

	// 관리자
	public List<Pc> list(Pc pc) { 
		return pd.list(pc);
	}
	public int permit(int pcno) { 
		return pd.permit(pcno);
	}
	public int getTotal(Pc pc) {
		return pd.getTotal(pc);
	}
	@Override
	public List<Pc> listMap() {
		return pd.listMap();
	} 


}
