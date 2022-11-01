package org.mini.model;

public class DiaryCriteriaVO {

	private int pageNum; // 페이지 번호
	private int amount; // 한페이지당 게시물 갯수

	public DiaryCriteriaVO() {
		this(1,1);
	}
	public DiaryCriteriaVO(int pageNum, int amount) {
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

}
