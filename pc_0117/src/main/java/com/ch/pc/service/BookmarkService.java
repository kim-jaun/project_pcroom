package com.ch.pc.service;

public interface BookmarkService {

	int select(int mno, int pcno);

	void delete(int mno, int pcno);

	void insert(int mno, int pcno);

}
