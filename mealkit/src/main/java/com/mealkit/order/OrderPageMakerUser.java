package com.mealkit.order;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class OrderPageMakerUser {

	private int totalCount;	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 10;

	private OrderCriteriaUser cri;

	public void setCri(OrderCriteriaUser cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		calcData();
	}

	private void calcData() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;

		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	}

	public int getTotalCount() {
		return totalCount;
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

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public OrderCriteriaUser getCri() {
		return cri;
	}

	public String makeQuery(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				//.queryParam("perPageNum", cri.getPerPageNum()).build();
				.build();
		return uriComponents.toUriString();
	}

	/*
	 * public String makeSearch(int page) { cri.setPerPageNum(10); UriComponents
	 * uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
	 * .queryParam("page",page) .queryParam("perPageNum", cri.getPerPageNum())
	 * .queryParam("searchType", ((OrderCriteria) cri).getSearchType())
	 * .queryParam("keyword", ((OrderCriteria) cri).getKeyword()) .build(); return
	 * uriComponents.toUriString(); }
	 */
}
