package org.mini.model;

public class VideoPageVO {
	// ?��?��번호
	private int startPage;
	// ?��번호
	private int endPage;
	// ?��?��버튼
	private boolean prev;
	// ?��?��버튼
	private boolean next;
	// CriteriaVO ?��?��
	private CriteriaVO cri;
	// board?��?��블의 ?��체건?���? ???��
	private int total;

	// 매개�??���?2개인 ?��?��?�� ?��?��
	public VideoPageVO(CriteriaVO cri, int total) {
		this.cri = cri;
		this.total = total;

		// ?��번호 = (?��?��?��?���?/10)(?���?)*10
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		// ?��?��번호,?��번호,?��?��버튼,?��?��버튼 계산
		// ?��번호�? 10 ?��?��번호 1, ?��번호�?20 ?��?��번호 11 -> ?��?��번호 = ?��번호-9
		this.startPage = this.endPage - 9;

		// ?��?�� 마�?�? ?��?���? 번호?�� ?��체건?���? 고려?��?��?��
		// ?��?�� 마�?�? ?��번호=?��?��건수(?���?)/?��?���??�� 게시�? �??��
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		// 123*1.0 =123.0
		// 123.0/10=12.3(?���?)->13

		// 13(realEnd)<20(endPage) -> realEnd?��?��
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		// startPage�? 1보다 ?���? ?��?��버튼 ?��?��?��
		this.prev = this.startPage > 1;

		// endPage�? realEnd보다 ?��?���? ?��?��버튼 ?��?��?��
		this.next = this.endPage < realEnd;

	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public CriteriaVO getCri() {
		return cri;
	}

	public void setCri(CriteriaVO cri) {
		this.cri = cri;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", cri=" + cri + ", total=" + total + "]";
	}

}
