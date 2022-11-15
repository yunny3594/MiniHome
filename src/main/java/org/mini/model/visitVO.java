package org.mini.model;

import java.util.Date;

public class visitVO {
	// 방명록 글 번호
	private int vno;
	// 작성자 아이디
	private String userid;
	// 내용
	private String content;
	// date
	private Date regdate;
	// 멤버인지 확인
	private boolean mem;
	// join해서 나타낼것
	private String username;

	public int getVno() {
		return vno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public boolean isMem() {
		return mem;
	}

	public void setMem(boolean mem) {
		this.mem = mem;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
