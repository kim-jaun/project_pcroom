package com.ch.pc.service;

import java.util.List;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Reservation;

public interface ReservationService {

	int getTotal(int mno);

//	List<Pc> rList(Reservation reservation);

	List<Pc> rList(int mno);

}
