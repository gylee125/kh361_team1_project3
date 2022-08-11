package com.mealkit.board;

public class MemberPage {

	public Number getmNo() {
		return mNo;
	}
	public void setmNo(Number mNo) {
		this.mNo = mNo;
	}
	
	public String getmId() {
		return mId;
	}
	
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	private Number mNo;
	private String mId;
	private String pw;

	

	public String getReviews() {
		return reviews;
	}
	public void setReviews(String reviews) {
		this.reviews = reviews;
	}

	private String reviews;
	
	public MemberPage(Number mNo, String mId, String pw, String reviews) {
		this.mNo = mNo;
		this.mId = mId;
		this.pw = pw;
		this.reviews = reviews;
	}
	
	public MemberPage() {
		
	}
	
	public boolean eqauls(Object o) {
		
		if( o instanceof MemberPage) {
			MemberPage m = (MemberPage)o;
			return mNo == m.mNo;
		}
		return false;
		
		
	}
	
}
