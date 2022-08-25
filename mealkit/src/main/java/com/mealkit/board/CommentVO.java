package com.mealkit.board;

import java.util.Date;
import java.util.List;
import java.util.Map;
import lombok.Data;


@Data
public class CommentVO {


	private Integer rno;
	private Integer pid;

	private String mId;
	private String content;
	private Date regDate;
	private Date updatedate;
	
	
	//added
	private String[] files;
	/*
	 * 
	 * public CommentVO(Number rno,String mId,String content,Date regDate) {
	 * this.rno = rno; this.mId = mId; this.content = content; this.regDate =
	 * regDate; }
	 * 
	 * public CommentVO(String mId,String pid,String content,Date regDate) {
	 * this.mId = mId; this.pid = pid; this.content = content; this.regDate =
	 * regDate; }
	 * 
	 * public CommentVO(String mId,String content,Date regDate) { this.mId = mId;
	 * this.content = content; this.regDate = regDate; }//pid없음
	 * 
	 * public CommentVO(MemberDTO memberDTO,String content,Date regDate) { this.mId
	 * = memberDTO.getmId(); this.content = content; this.regDate = regDate; }
	 * 
	 * public CommentVO(String mId,String content) { this.mId = mId; this.content =
	 * content; }
	 */
	

	/*
	 * public boolean equals(Object o) { if(o instanceof CommentVO) { CommentVO c =
	 * (CommentVO)o; return rno == c.rno; } return false; }
	 */


	public void validate(Map<String, Boolean> errors) {
		if (content == null || content.trim().isEmpty()) {
			errors.put(content, Boolean.TRUE);
		}
	}

}
