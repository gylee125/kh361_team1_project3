package com.mealkit.board;

import java.util.Date;

public class CommunityVO {
	
	private int cNo;
	private String mId;
	private int mLevel;
	private String title;
	private String content;
	private Date regDate;
	
	public int getcNo() {
		return cNo;
	}
	
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	
	public String getmId() {
		return mId;
	}
	
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	public int getmLevel() {
		return mLevel;
	}
	
	public void setmLevel(int mLevel) {
		this.mLevel = mLevel;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "CommunityVO [cNo=" + cNo + ", mId=" + mId + ", mLevel=" + mLevel + ", title=" + title + ", content="
				+ content + ", regDate=" + regDate + "]";
	}
	
}
