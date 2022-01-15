package com.ch.pc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.model.Seat;

@Repository
public class PcDaoImpl implements PcDao {	
	@Autowired
	private SqlSessionTemplate sst;

	public List<Pc> selectPcbnm(String pcbusinessnum) {
		return sst.selectList("pcns.selectPcbnm", pcbusinessnum);
	}
	public List<Pc> selectPcpno(String pcpno) {
		return sst.selectList("pcns.selectPcpno", pcpno);
	}
	public int insertPc(Pc pc) {
		return sst.insert("pcns.insertPc", pc);
	}
	public int givePcno() {
		return sst.selectOne("pcns.givePcno");
	}
	public void insertPcimage(List<Pcimage> images) {
		sst.insert("pcns.insertPcimage", images);
	}
	public void insertPi(Pcimage pi) {
		sst.insert("pcns.insertPi", pi);
	}
	public Pc select(int pcno) {
		return sst.selectOne("pcns.select", pcno);
	}
	public List<Pcimage> listPhoto(int pcno) {
		return sst.selectList("pcns.listPhoto", pcno);
	}
	public int insertSeat(Seat seat) {
		return sst.insert("pcns.insertSeat", seat);
	}
	public Seat selectseat(int pcno) {
		return sst.selectOne("pcns.selectSeat", pcno);
	}
	public int updateseat(Seat seat) {
		return sst.update("pcns.updateSeat", seat);
	}
	public String listSeat(int pcno) {
		return sst.selectOne("pcns.listSeat", pcno);
	}
	public int updateseatform(Pc pc) {
		return sst.update("pcns.updateseatform", pc);
	}



}
