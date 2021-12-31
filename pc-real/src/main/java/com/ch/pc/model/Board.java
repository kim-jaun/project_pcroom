package com.ch.pc.model;
import java.sql.Date;
import lombok.Data;
@Data
public class Board {
	private int bno;
	private String subject;
	private String content;
	private Date reg_date;
	private int read_cnt;
	private int likes;
	private String del;
	private int mno;
}