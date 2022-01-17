package com.ch.pc.dao;

import java.util.List;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;

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

}
