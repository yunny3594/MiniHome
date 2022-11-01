package org.mini.model;

import java.util.ArrayList;

public class PhotoVO {
	private int bno;
	private String id;
	private String title;
	private String content;
	private String updatedate;
	private int likecnt;
	private int folder;
	private String file_address;
	private ArrayList<AttachFileVO> attach;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	public ArrayList<AttachFileVO> getAttach() {
		return attach;
	}
	public void setAttach(ArrayList<AttachFileVO> attach) {
		this.attach = attach;
	}
	@Override
	public String toString() {
		return "PhotoVO [bno=" + bno + ", id=" + id + ", title=" + title + ", content=" + content + ", updatedate="
				+ updatedate + ", likecnt=" + likecnt + ", attach=" + attach + "]";
	}
	public String getFile_address() {
		return file_address;
	}
	public void setFile_address(String file_address) {
		this.file_address = file_address;
	}
	public int getFolder() {
		return folder;
	}
	public void setFolder(int folder) {
		this.folder = folder;
	}


}
