package com.ch.pc.model;


public class Bookmark {
	private int mno;
	private int pcno;
	
	// 북마크
	private String pcname;
	private String pcaddr;
	private String pcinfo; 
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
	public String getPcname() {
		return pcname;
	}
	public void setPcname(String pcname) {
		this.pcname = pcname;
	}
	public String getPcaddr() {
		return pcaddr;
	}
	public void setPcaddr(String pcaddr) {
		this.pcaddr = pcaddr;
	}
	public String getPcinfo() {
		return pcinfo;
	}
	public void setPcinfo(String pcinfo) {
		this.pcinfo = pcinfo;
	}
		
}
