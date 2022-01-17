package com.ch.pc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDaoImpl implements BookmarkDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int select(int mno, int pcno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", mno);
		map.put("pcno", pcno);
		return sst.selectOne("bookmarkns.select",map);
	}

	@Override
	public void delete(int mno, int pcno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", mno);
		map.put("pcno", pcno);
		sst.delete("bookmarkns.delete",map);
		
	}

	@Override
	public void insert(int mno, int pcno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", mno);
		map.put("pcno", pcno);
		sst.insert("bookmarkns.insert",map);
		
	}
}
