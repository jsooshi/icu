package com.porget.domain;

public class PageDTO {
	// list.jsp페이지에서 출력되는 데이터를 표현, 제한[하단의 숫자출력, 현재페이지]하는용도

	private int startPage;// 시작페이지 : 예) 1....10 보일때 1
							// 31 32 보일때 31
	private int endPage;// 끝페이지 : 예) 1....10 보일때 10, 31 32 보일때 32
	
	private boolean prev, next; // list.jsp에서 '이전' '다음' 버튼을 보일지 여부를 표현

	private int total; // 전체레코드 수표현?O 전체 페이지 번호 출력하는 수?X
	private Criteria cri; // 현재 페이지와 화면의 출력될 게시물 수를 ㅍ현

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		// 가정: 레코드(게시글)수 320개, 한화면에 보여질 레코드(게시글)수 10개, 현재 페이지가 31
		// 하단에 출력될 숫자는? 1~32
		//

		endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10; // 40
		startPage = endPage - 9;// 31

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));// 실제 끝번호 32

		if (realEnd < endPage)
			endPage = realEnd;// 32

		prev = startPage > 1; // true ('이전' 버튼 보임)
		next = endPage < realEnd; // false ('다음' 버튼 안보임)
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotal() {
		return total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	

}
