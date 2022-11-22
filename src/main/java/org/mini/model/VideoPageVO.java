package org.mini.model;

public class VideoPageVO {
	// ??λ²νΈ
	private int startPage;
	// ?λ²νΈ
	private int endPage;
	// ?΄? λ²νΌ
	private boolean prev;
	// ?€?λ²νΌ
	private boolean next;
	// CriteriaVO ?¬?¨
	private CriteriaVO cri;
	// board??΄λΈμ ? μ²΄κ±΄?λ₯? ???₯
	private int total;

	// λ§€κ°λ³??κ°?2κ°μΈ ??±? ? ?Έ
	public VideoPageVO(CriteriaVO cri, int total) {
		this.cri = cri;
		this.total = total;

		// ?λ²νΈ = (??¬??΄μ§?/10)(?¬λ¦?)*10
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		// ??λ²νΈ,?λ²νΈ,?΄? λ²νΌ,?€?λ²νΌ κ³μ°
		// ?λ²νΈκ°? 10 ??λ²νΈ 1, ?λ²νΈκ°?20 ??λ²νΈ 11 -> ??λ²νΈ = ?λ²νΈ-9
		this.startPage = this.endPage - 9;

		// ? ?Ό λ§μ?λ§? ??΄μ§? λ²νΈ? ? μ²΄κ±΄?λ₯? κ³ λ €?΄?Ό?¨
		// ? ?Ό λ§μ?λ§? ?λ²νΈ=? ? κ±΄μ(?¬λ¦?)/??΄μ§??Ή κ²μλ¬? κ°??
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		// 123*1.0 =123.0
		// 123.0/10=12.3(?¬λ¦?)->13

		// 13(realEnd)<20(endPage) -> realEnd? ?©
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		// startPageκ°? 1λ³΄λ€ ?¬λ©? ?΄? λ²νΌ ??±?
		this.prev = this.startPage > 1;

		// endPageκ°? realEndλ³΄λ€ ??Όλ©? ?€?λ²νΌ ??±?
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
