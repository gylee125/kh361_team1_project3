package com.mealkit.board;

import java.util.Date;
import java.util.List;

import com.mealkit.member.MemberPage;
import com.mealkit.board.CommentVO;

public class ReviewPage {
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<MemberPage> getMember() {
		return member;
	}
	public void setMember(List<MemberPage> member) {
		this.member = member;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
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
	public List<CommentVO> getCommentdto() {
		return commentdto;
	}
	public void setCommentdto(List<CommentVO> commentdto) {
		this.commentdto = commentdto;
	}

	
	private int total;
	private int currentPage;
	private List<MemberPage> member;
	private List<CommentVO> commentdto;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public Date getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	private String mId;
	private Date submitDate;
	private String comment;
	
	
	public int getRNo() {
		return RNo;
	}
	public void setRNo(int rNo) {
		RNo = rNo;
	}
	private int RNo;
	
	
	/*
	 * public ReviewPage(List<MemberPage> member) { this.member = member; }
	 */
	
	public ReviewPage(String mId , Date submitDate, String comment) {
		this.mId = mId;
		this.submitDate = submitDate;
		this.comment = comment;
	}
	
	public ReviewPage(List<CommentVO> commentdto) {
		this.commentdto = commentdto;
	}

}
