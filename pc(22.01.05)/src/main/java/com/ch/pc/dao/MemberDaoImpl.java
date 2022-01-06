package com.ch.pc.dao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.pc.model.Member1;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(Member1 member1) {
		return sst.insert("member1ns.insert", member1);
	}
	public Member1 select(String id) {
		return sst.selectOne("member1ns.select",id);
	}
	public Member1 confirmNick_name(String nick_name) {
		return sst.selectOne("member1ns.confirmNick_name", nick_name);
	}
	public Member1 confirmEmail(String email) {
		return sst.selectOne("member1ns.confirmEmail", email);
	}
	public Member1 findId(Member1 member1) {
		return sst.selectOne("member1ns.findId", member1);
	}
	public Member1 findPw(Member1 member1) {
		return sst.selectOne("member1ns.findPw", member1);
	}
	public int updatePw(Member1 member1) {
		return sst.update("member1ns.updatePw", member1);
	}
	public int update(Member1 member1) {
		return sst.update("member1ns.update", member1);
	}

}
