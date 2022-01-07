package com.ch.pc.service;

import java.util.List;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;

public interface PcService {

	List<Pc> selectPcbnm(String pcbusinessnum);

	List<Pc> selectPcpno(String pcpno);

	int insertPc(Pc pc);

	int givePcno();

	void insertPcimage(List<Pcimage> images);

	Pc select(int pcno);

	List<Pcimage> listPhoto(int pcno);




}
