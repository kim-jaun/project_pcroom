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

	public List<Board> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
	return sst.selectList("boardns.list", map);
	}
	public int getTotal() {
		return sst.selectOne("boardns.getTotal");
	}
	public Board select(int pcno, int bno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pcno", pcno);
		map.put("bno", bno);
		return sst.selectOne("boardns.select", map);
	}
	public void updateRead_cnt(int pcno, int bno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pcno", pcno);
		map.put("bno", bno);
		sst.update("boardns.updateRead_cnt", map);		
	}
	public int update(Board board) {
		return sst.update("boardns.update", board);
	}
	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}
	public int delete(int pcno, int bno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pcno", pcno);
		map.put("bno", bno);
	return sst.update("boardns.delete", map);
	}
}
