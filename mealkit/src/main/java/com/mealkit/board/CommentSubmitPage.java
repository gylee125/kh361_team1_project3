package com.mealkit.board;

import java.util.Date;
import java.util.Map;

import com.mealkit.member.MemberPage;
import com.mealkit.member.MemberDTO;

public class CommentSubmitPage {

	public String getReviews() {
		return reviews;
	}

	public void setReviews(String reviews) {
		this.reviews = reviews;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public MemberDTO getMemberdto() {
		return memberdto;
	}

	public void setMemberdto(MemberDTO memberdto) {
		this.memberdto = memberdto;
	}

	private MemberDTO memberdto;
	private String reviews;
	private Date date;

	public CommentSubmitPage(MemberDTO memberdto, String reviews, Date date) {
		this.memberdto = memberdto;
		this.reviews = reviews;
		this.date = date;
	}

	public void validate(Map<String, Boolean> errors) {
		if (reviews == null || reviews.trim().isEmpty()) {
			errors.put(reviews, Boolean.TRUE);
		}
	}

}
