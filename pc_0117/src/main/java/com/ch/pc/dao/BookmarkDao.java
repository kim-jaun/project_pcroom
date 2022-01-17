package com.ch.pc.dao;

public interface BookmarkDao {

	int select(int mno, int pcno);

	void delete(int mno, int pcno);

	void insert(int mno, int pcno);

}
