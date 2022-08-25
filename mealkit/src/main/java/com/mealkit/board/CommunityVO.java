package com.mealkit.board;

import java.util.Date;
import lombok.*;

@Data
public class CommunityVO {
	
	private Integer cNo;
	private String title;
	private String content;
	private String mId;
	private int mLevel;
	private Date regDate;
	
	/*
	 * public Integer getcNo() { return cNo; } public void setcNo(Integer cNo) {
	 * this.cNo = cNo; } public String getTitle() { return title; } public void
	 * setTitle(String title) { this.title = title; } public String getContent() {
	 * return content; } public void setContent(String content) { this.content =
	 * content; } public String getmId() { return mId; } public void setmId(String
	 * mId) { this.mId = mId; } public int getmLevel() { return mLevel; } public
	 * void setmLevel(int mLevel) { this.mLevel = mLevel; } public Date getRegDate()
	 * { return regDate; } public void setRegDate(Date regDate) { this.regDate =
	 * regDate; }
	 * 
	 * @Override public String toString() { return "CommunityVO [cNo=" + cNo +
	 * ", title=" + title + ", content=" + content + ", mId=" + mId + ", mLevel=" +
	 * mLevel + ", regDate=" + regDate + "]"; }
	 */
	
}
