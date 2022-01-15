package com.ch.pc.dao;

import java.util.List;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.model.Seat;

public interface PcDao {
	List<Pc> selectPcbnm(String pcbusinessnum);

	List<Pc> selectPcpno(String pcpno);

	int insertPc(Pc pc);

	int givePcno();

	void insertPi(Pcimage pi);

	void insertPcimage(List<Pcimage> images);

	Pc select(int pcno);

	List<Pcimage> listPhoto(int pcno);

	int insertSeat(Seat seat);

	Seat selectseat(int pcno);

	int updateseat(Seat seat);

	String listSeat(int pcno);

	int updateseatform(Pc pc);






}
