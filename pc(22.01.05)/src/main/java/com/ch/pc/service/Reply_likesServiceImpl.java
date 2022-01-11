package com.ch.pc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.pc.dao.Reply_likesDao;

@Service
public class Reply_likesServiceImpl implements Reply_likesService {
	@Autowired
	private Reply_likesDao rld;
}
