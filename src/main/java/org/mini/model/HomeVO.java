package org.mini.model;

import javax.xml.crypto.Data;

public class HomeVO {
	private Data regdate;
	private String title;

	public Data getRegdate() {
		return regdate;
	}

	public void setRegdate(Data regdate) {
		this.regdate = regdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "HomeVO [regdate=" + regdate + ", title=" + title + ", getRegdate()=" + getRegdate() + ", getTitle()="
				+ getTitle() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}
