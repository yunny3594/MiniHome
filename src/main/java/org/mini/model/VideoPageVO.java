package org.mini.model;

public class VideoPageVO {
	// ?‹œ?‘ë²ˆí˜¸
	private int startPage;
	// ?ë²ˆí˜¸
	private int endPage;
	// ?´? „ë²„íŠ¼
	private boolean prev;
	// ?‹¤?Œë²„íŠ¼
	private boolean next;
	// CriteriaVO ?¬?•¨
	private CriteriaVO cri;
	// board?…Œ?´ë¸”ì˜ ? „ì²´ê±´?ˆ˜ë¥? ???¥
	private int total;

	// ë§¤ê°œë³??ˆ˜ê°?2ê°œì¸ ?ƒ?„±? ?„ ?–¸
	public VideoPageVO(CriteriaVO cri, int total) {
		this.cri = cri;
		this.total = total;

		// ?ë²ˆí˜¸ = (?˜„?¬?˜?´ì§?/10)(?˜¬ë¦?)*10
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		// ?‹œ?‘ë²ˆí˜¸,?ë²ˆí˜¸,?´? „ë²„íŠ¼,?‹¤?Œë²„íŠ¼ ê³„ì‚°
		// ?ë²ˆí˜¸ê°? 10 ?‹œ?‘ë²ˆí˜¸ 1, ?ë²ˆí˜¸ê°?20 ?‹œ?‘ë²ˆí˜¸ 11 -> ?‹œ?‘ë²ˆí˜¸ = ?ë²ˆí˜¸-9
		this.startPage = this.endPage - 9;

		// ? œ?¼ ë§ˆì?ë§? ?˜?´ì§? ë²ˆí˜¸?Š” ? „ì²´ê±´?ˆ˜ë¥? ê³ ë ¤?•´?•¼?•¨
		// ? œ?¼ ë§ˆì?ë§? ?ë²ˆí˜¸=? „? œê±´ìˆ˜(?˜¬ë¦?)/?˜?´ì§??‹¹ ê²Œì‹œë¬? ê°??ˆ˜
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		// 123*1.0 =123.0
		// 123.0/10=12.3(?˜¬ë¦?)->13

		// 13(realEnd)<20(endPage) -> realEnd? ?š©
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		// startPageê°? 1ë³´ë‹¤ ?¬ë©? ?´? „ë²„íŠ¼ ?™œ?„±?™”
		this.prev = this.startPage > 1;

		// endPageê°? realEndë³´ë‹¤ ?‘?œ¼ë©? ?‹¤?Œë²„íŠ¼ ?™œ?„±?™”
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
