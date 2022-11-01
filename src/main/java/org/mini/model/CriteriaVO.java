package org.mini.model;

public class CriteriaVO {

	private int pageNum; // 페이지 번호
	private int amount; // 한페이지당 게시물 갯수
	private int folder;
	
	public CriteriaVO() {
		this(1,5);
	}
	public CriteriaVO(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "CriteriaVO [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	public int getFolder() {
		return folder;
	}
	public void setFolder(int folder) {
		this.folder = folder;
	}
}
