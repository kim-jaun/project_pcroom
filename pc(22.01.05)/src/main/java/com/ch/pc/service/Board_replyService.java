package com.ch.pc.service;

import java.util.List;

import com.ch.pc.model.Board_reply;

public interface Board_replyService {

	List<Board_reply> list(int pcno, int bno);

	void insert(Board_reply board_reply);

}
