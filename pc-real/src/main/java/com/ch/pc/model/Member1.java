package com.ch.pc.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member1 {
	private int mno;
	private String id;
	private String password;
	private String name;
	private String nick_name;
	private String phone;
	private String gender;
	private int age;
	private String email;
	private Date reg_date;
    private String del;
    private String blacklist;
    private String identity;
}
