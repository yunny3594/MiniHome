package org.mini.model;

import java.util.Date;

public class ilchonVO {
	private int ino;
	private String content;
	private String userid;
	private Date regdate;
	//조인했을때 member에서 나와야할것
	private String username;
	private String ilchon;
	
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIlchon() {
		return ilchon;
	}

	public void setIlchon(String ilchon) {
		this.ilchon = ilchon;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
