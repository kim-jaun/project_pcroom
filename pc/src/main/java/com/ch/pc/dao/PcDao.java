package com.ch.pc.dao;

import java.util.List;

import com.ch.pc.model.Fee;
import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;
import com.ch.pc.model.Reservation;
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

	List<Pc> list(Pc pc);

	int permit(int pcno);

	int getTotal(Pc pc);

	List<Pc> listMap();

	String listSeat(int pcno);

	int updateseatform(Pc pc);

	Seat selectseat(int pcno);

	int insertSeat(Seat seat);

	int updateseat(Seat seat);

	Pc selectMno(int mno);

	int feeInsert(Fee fee);

	Fee selectFee(int pcno);

	int feeUpdate(Fee fee);

	int insertReservation(Reservation reservation);

	List<Pc> searchpc(String a1, String a2, String a3);

	List<Pc> searchpc1(String a1);


}
