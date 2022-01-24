package com.ch.pc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	//예매내역
	public int getTotal(int mno) {
		return sst.selectOne("reservationns.getTotal", mno);
	}
//	public List<Pc> rList(Reservation reservation) {
//		return sst.selectList("reservationns.rList", reservation);
//	}
	@Override
	public List<Pc> rList(int mno) {
		return sst.selectList("reservationns.rList", mno);
	}
}
