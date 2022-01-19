package com.ch.pc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pc.dao.PcDao;
import com.ch.pc.model.Fee;
import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.model.Reservation;
import com.ch.pc.model.Seat;

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
	@Override
	public String listSeat(int pcno) {
		return pd.listSeat(pcno);
	}
	@Override
	public int updateSeatform(Pc pc) {
		return pd.updateseatform(pc);
	}
	@Override
	public Seat selectseat(int pcno) {
		return pd.selectseat(pcno);
	}
	@Override
	public int insertSeat(Seat seat) {
		return pd.insertSeat(seat);
	}
	@Override
	public int updateSeat(Seat seat) {
		return pd.updateseat(seat);
	}
	@Override
	public Pc selectMno(int mno) {
		return pd.selectMno(mno);
	}
	@Override
	public int feeInsert(Fee fee) {
		return pd.feeInsert(fee);
	}
	@Override
	public Fee selectFee(int pcno) {
		return pd.selectFee(pcno);
	}
	@Override
	public int feeUpdate(Fee fee) {
		return pd.feeUpdate(fee);
	}
	@Override
	public int insertReservation(Reservation reservation) {
		return pd.insertReservation(reservation);
	}
	public List<Pc> searchpc(String a1, String a2, String a3) {
		return pd.searchpc(a1, a2, a3);
	}
	@Override
	public List<Pc> searchpc1(String a1) {
		return pd.searchpc1(a1);
	}


}
