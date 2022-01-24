package com.ch.pc.dao;

import java.util.List;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Reservation;

public interface ReservationDao {

	int getTotal(int mno);

//	List<Pc> rList(Reservation reservation);

	List<Pc> rList(int mno);

}
