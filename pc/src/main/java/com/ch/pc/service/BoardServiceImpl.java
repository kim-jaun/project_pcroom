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

	@Override
	public List<Board> list(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return bd.list(startRow, endRow);
	}

	@Override
	public int insert(Board board) {
		// TODO Auto-generated method stub
		return bd.insert(board);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return bd.getTotal();
	}

	@Override
	public Board select(int num) {
		// TODO Auto-generated method stub
		return bd.select(num);
	}

	@Override
	public void updateReadcount(int num) {
		bd.updateReadcount(num);
		
	}

	@Override
	public int update(Board board) {
		// TODO Auto-generated method stub
		return bd.update(board);
	}

	@Override
	public int delete(int num) {
		// TODO Auto-generated method stub
		return bd.delete(num);
	}

	@Override
	public int maxNum() {
		// TODO Auto-generated method stub
		return bd.maxNum();
	}

	@Override
	public void updateStep(Board board) {
		// TODO Auto-generated method stub
		bd.updateStep(board);
	}
}
