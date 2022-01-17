package com.ch.pc.service;

import java.util.List;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.model.Seat;

public interface PcService {

	List<Pc> selectPcbnm(String pcbusinessnum);

	List<Pc> selectPcpno(String pcpno);

	int insertPc(Pc pc);

	int givePcno();

	void insertPcimage(List<Pcimage> images);

	Pc select(int pcno);

	List<Pcimage> listPhoto(int pcno);

	int insertSeat(Seat seat);

	Seat selectseat(int pcno);

	int updateSeat(Seat seat);

	String listSeat(int pcno);

	int updateSeatform(Pc pc);
	
	int permit(int pcno);

	List<Pc> listMap();

	int getTotal(Pc pc);

	List<Pc> list(Pc pc);






}
