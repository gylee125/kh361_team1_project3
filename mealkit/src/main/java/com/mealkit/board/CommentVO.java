package com.mealkit.board;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mealkit.member.MemberDTO;

public class CommentVO {

	@Override
	public String toString() {
		return "CommentVO [memberDTO=" + memberDTO + ", rno=" + rno + ", mId=" + mId + ", pid=" + pid + ", content="
				+ content + ", regDate=" + regDate + ", updatedate=" + updatedate + "]";
	}





	public MemberDTO getMemberDTO() {
		return memberDTO;
	}





	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}








	public String getmId() {
		return mId;
	}





	public void setmId(String mId) {
		this.mId = mId;
	}





	public Number getRno() {
		return rno;
	}





	public void setRno(Number rno) {
		this.rno = rno;
	}





	public String getPid() {
		return pid;
	}





	public void setPid(String pid) {
		this.pid = pid;
	}





	public Date getUpdatedate() {
		return updatedate;
	}





	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
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





	private MemberDTO memberDTO;
	
	private Number rno;
	private String mId;
	private String pid;
	private String content;
	private Date regDate;
	private Date updatedate;
	
	
	public CommentVO(Number rno,String mId,String content,Date regDate) {
		this.rno = rno;
		this.mId = mId;
		this.content = content;
		this.regDate = regDate;
	}
	
	public CommentVO(String mId,String pid,String content,Date regDate) {
		this.mId = mId;
		this.pid = pid;
		this.content = content;
		this.regDate = regDate;
	}
	
	public CommentVO(String mId,String content,Date regDate) {
		this.mId = mId;
		this.content = content;
		this.regDate = regDate;
	}//pid없음

	public CommentVO(MemberDTO memberDTO,String content,Date regDate) {
		this.mId = memberDTO.getmId();
		this.content = content;
		this.regDate = regDate;
	}
	
	public CommentVO(String mId,String content) {
		this.mId = mId;
		this.content = content;
	}
	

	
	public boolean equals(Object o) {
		if(o instanceof CommentVO) {
			CommentVO c = (CommentVO)o;
			return rno == c.rno;
		}
		return false;
	}



	public void validate(Map<String, Boolean> errors) {
		if (content == null || content.trim().isEmpty()) {
			errors.put(content, Boolean.TRUE);
		}
	}

}
