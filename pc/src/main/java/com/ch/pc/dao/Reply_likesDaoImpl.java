package com.ch.pc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Reply_likesDaoImpl implements Reply_likesDao {
	@Autowired
	private SqlSessionTemplate sst;
}
