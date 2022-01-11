package com.ch.pc.service;

import java.util.List;

import com.ch.pc.model.Board;

public interface BoardService {

	List<Board> list(int startRow, int endRow);

	int insert(Board board);

	int getTotal();

	Board select(int num);

	void updateReadcount(int num);

	int update(Board board);

	int delete(int num);

	int maxNum();

	void updateStep(Board board);

}
