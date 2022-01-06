package com.ch.pc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pc.model.Pc;
import com.ch.pc.model.Pcimage;

@Repository
public class PcDaoImpl implements PcDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Pc> selectPcbnm(String pcbusinessnum) {
		return sst.selectList("pcns.selectPcbnm", pcbusinessnum);
	}

	@Override
	public List<Pc> selectPcpno(String pcpno) {
		return sst.selectList("pcns.selectPcpno", pcpno);
	}

	@Override
	public int insertPc(Pc pc) {
		return sst.insert("pcns.insertPc", pc);
	}

	@Override
	public int givePcno() {
		return sst.selectOne("pcns.givePcno");
	}
	@Override
	public void insertPcimage(List<Pcimage> images) {
		sst.insert("pcns.insertPcimage", images);
	}
	@Override
	public void insertPi(Pcimage pi) {
		sst.insert("pcns.insertPi", pi);
	}



}
