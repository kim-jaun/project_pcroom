package com.ch.pc.dao;

import java.util.List;

import com.ch.pc.model.Board_reply;

public interface Board_replyDao {

	List<Board_reply> list(int pcno, int bno);

	void insert(Board_reply board_reply);

}
