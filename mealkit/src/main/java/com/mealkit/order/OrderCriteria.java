package com.mealkit.order;

public class OrderCriteria {

	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;

	public OrderCriteria() {
	    this.page = 1;
	    this.perPageNum = 10;
	    this.searchType = null;
	    this.keyword = null;
	  }

	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPageStart() {

		return (this.page - 1) * perPageNum + 1;
	}

	public int getPageEnd() {
		return (this.page - 1) * perPageNum + 10;
	}

	public int getPerPageNum() {

		return this.perPageNum;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
