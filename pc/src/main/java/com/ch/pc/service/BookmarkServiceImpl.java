package com.ch.pc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pc.dao.BookmarkDao;

@Service
public class BookmarkServiceImpl implements BookmarkService{
	@Autowired
	private BookmarkDao bd;

	@Override
	public int select(int mno, int pcno) {
		// TODO Auto-generated method stub
		return bd.select(mno,pcno);
	}

	@Override
	public void delete(int mno, int pcno) {
		bd.delete(mno,pcno);
		
	}

	@Override
	public void insert(int mno, int pcno) {
		bd.insert(mno,pcno);
		
	}
	
}
