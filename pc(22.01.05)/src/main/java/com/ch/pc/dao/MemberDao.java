package com.ch.pc.dao;

import com.ch.pc.model.Member1;

public interface MemberDao {

	int insert(Member1 member1);
	
	Member1 select(String id);

	Member1 confirmNick_name(String nick_name);

	Member1 confirmEmail(String email);

	Member1 findId(Member1 member1);

	Member1 findPw(Member1 member1);

	int updatePw(Member1 member1);

	int update(Member1 member1);

}
