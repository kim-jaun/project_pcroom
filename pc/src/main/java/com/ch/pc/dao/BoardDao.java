package com.ch.pc.dao;

import java.util.List;

import com.ch.pc.model.Board;

public interface BoardDao {

	List<Board> list(int startRow, int endRow);

	int getTotal();

	Board select(int pcno, int bno);

	void updateRead_cnt(int pcno, int bno);

	int update(Board board);

	int insert(Board board);

	int delete(int pcno, int bno);

}
