package com.ch.pc.model;

import org.springframework.web.multipart.MultipartFile;



public class Pc {
	private int pcno;
	private String pcbusinessnum;
	private String pcpno;
	private String pcname;
	private String pcaddr;
	private int pclikes;
	private String pcinfo;
	private int seatlow;
	private int seatcol;
	private int mno;
	private int feeno;
	private String imagename;
	private MultipartFile pcimage;
	private float pclati;
	private float pclongi;
	//승인확인용
	private String permit; 
	
	//검색용
 	private String searchKey;
 	private String searchValue;
 	//페이징용
 	private int startRow;
 	private int endRow;
	
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public float getPclati() {
		return pclati;
	}
	public void setPclati(float pclati) {
		this.pclati = pclati;
	}
	public float getPclongi() {
		return pclongi;
	}
	public void setPclongi(float pclongi) {
		this.pclongi = pclongi;
	}
	public int getSeatlow() {
		return seatlow;
	}
	public void setSeatlow(int seatlow) {
		this.seatlow = seatlow;
	}
	public int getSeatcol() {
		return seatcol;
	}
	public void setSeatcol(int seatcol) {
		this.seatcol = seatcol;
	}
	public int getPcno() {
		return pcno;
	}
	public void setPcno(int pcno) {
		this.pcno = pcno;
	}
	public String getPcbusinessnum() {
		return pcbusinessnum;
	}
	public void setPcbusinessnum(String pcbusinessnum) {
		this.pcbusinessnum = pcbusinessnum;
	}
	public String getPcpno() {
		return pcpno;
	}
	public void setPcpno(String pcpno) {
		this.pcpno = pcpno;
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
	public int getPclikes() {
		return pclikes;
	}
	public void setPclikes(int pclikes) {
		this.pclikes = pclikes;
	}
	public String getPcinfo() {
		return pcinfo;
	}
	public void setPcinfo(String pcinfo) {
		this.pcinfo = pcinfo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getFeeno() {
		return feeno;
	}
	public void setFeeno(int feeno) {
		this.feeno = feeno;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public MultipartFile getPcimage() {
		return pcimage;
	}
	public void setPcimage(MultipartFile pcimage) {
		this.pcimage = pcimage;
	}
}
