package com.ch.pc.model;

import java.sql.Date;


public class Reservation {
	private int reserveno;
	private int mno;
	private int pcno;
	private int reservetime;	
	private String starttime;
	private String endtime;
	private String reserveSeatPosition;
	private String expiration;
	private Date reg_date;
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPcno() {
		return pcno;
	}
	public void setPcno(int pcno) {
		this.pcno = pcno;
	}
	public int getReservetime() {
		return reservetime;
	}
	public void setReservetime(int reservetime) {
		this.reservetime = reservetime;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getReserveSeatPosition() {
		return reserveSeatPosition;
	}
	public void setReserveSeatPosition(String reserveSeatPosition) {
		this.reserveSeatPosition = reserveSeatPosition;
	}
	public String getExpiration() {
		return expiration;
	}
	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
