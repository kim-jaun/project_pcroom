package com.ch.pc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pc.dao.BoardDao;
import com.ch.pc.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;

	public List<Board> list(int startRow, int endRow) {
		return bd.list(startRow, endRow);
	}
	public int getTotal() {
		return bd.getTotal();
	}
	public Board select(int pcno, int bno) {
		return bd.select(pcno, bno);
	}
	public void updateRead_cnt(int pcno, int bno) {
		bd.updateRead_cnt(pcno, bno);
	}
	public int update(Board board) {
		return bd.update(board);
	}
	public int insert(Board board) {
		return bd.insert(board);
	}
	public int delete(int pcno, int bno) {
		return bd.delete(pcno, bno);
	}
}
