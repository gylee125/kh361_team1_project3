package com.mealkit.product;

public class ProductCriteria {

	private int page;
	private int perPageNum;

	public ProductCriteria() {
		this.page = 1;
		this.perPageNum = 9;
	}

	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1;
		}

		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = perPageNum;
			return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	// method for MyBatis SQL Mapper -
	public int getPageStart() {

		return (this.page - 1) * perPageNum;
	}

	// method for MyBatis SQL Mapper
	public int getPerPageNum() {

		return perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}




}
