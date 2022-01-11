package com.ch.pc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pc.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Board> list(int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String , Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sst.selectList("boardns.list", map);
	}

	@Override
	public int insert(Board board) {
		// TODO Auto-generated method stub
		return sst.insert("boardns.insert", board);
	}

	@Override
	public int getTotal() {
		return sst.selectOne("boardns.getTotal");
	}

	@Override
	public Board select(int num) {
		// TODO Auto-generated method stub
		return sst.selectOne("boardns.select",num);
	}

	@Override
	public void updateReadcount(int num) {
		sst.update("boardns.updateReadcount", num);		
	}

	@Override
	public int update(Board board) {
		// TODO Auto-generated method stub
		return sst.update("boardns.update",board);
	}

	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
		return sst.update("boardns.delete",num);
	}

	@Override
	public int maxNum() {
		// TODO Auto-generated method stub
		return sst.selectOne("boardns.maxNum");
	}

	@Override
	public void updateStep(Board board) {
		sst.update("boardns.updateStep", board);
	}
}
