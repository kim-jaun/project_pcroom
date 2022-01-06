package com.ch.pc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pc.dao.MemberDao;
import com.ch.pc.model.Member1;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;
	
	public int insert(Member1 member1) {
		return md.insert(member1);
	}
	public Member1 select(String id) {
		return md.select(id);
	}
	public Member1 confirmNick_name(String nick_name) {
		return md.confirmNick_name(nick_name);
	}
	public Member1 confirmEmail(String email) {
		return md.confirmEmail(email);
	}
	public Member1 findId(Member1 member1) {
		return md.findId(member1);
	}
	public Member1 findPw(Member1 member1) {
		return md.findPw(member1);
	}
	public int updatePw(Member1 member1) {
		return md.updatePw(member1);
	}
	public int update(Member1 member1) {
		return md.update(member1);
	}
}
