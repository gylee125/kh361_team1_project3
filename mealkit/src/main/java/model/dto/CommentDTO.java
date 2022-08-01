package model.dto;

import java.util.Date;
import java.util.List;
import java.util.Map;

import model.dto.MemberDTO;

public class CommentDTO {

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}





	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}





	public Number getrNo() {
		return rNo;
	}





	public void setrNo(Number rNo) {
		this.rNo = rNo;
	}





	public String getmId() {
		return mId;
	}





	public void setmId(String mId) {
		this.mId = mId;
	}





	public String getpId() {
		return pId;
	}





	public void setpId(String pId) {
		this.pId = pId;
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
	
	private Number rNo;
	private String mId;
	private String pId;
	private String content;
	private Date regDate;
	
	
	public CommentDTO(Number rNo,String mId,String content,Date regDate) {
		this.rNo = rNo;
		this.mId = mId;
		this.content = content;
		this.regDate = regDate;
	}
	
	public CommentDTO(String mId,String pId,String content,Date regDate) {
		this.mId = mId;
		this.pId = pId;
		this.content = content;
		this.regDate = regDate;
	}
	
	public CommentDTO(String mId,String content,Date regDate) {
		this.mId = mId;
		this.content = content;
		this.regDate = regDate;
	}//Pid없음

	public CommentDTO(MemberDTO memberDTO,String content,Date regDate) {
		this.mId = memberDTO.getmId();
		this.content = content;
		this.regDate = regDate;
	}
	
	public CommentDTO(String mId,String content) {
		this.mId = mId;
		this.content = content;
	}
	

	
	public boolean equals(Object o) {
		if(o instanceof CommentDTO) {
			CommentDTO c = (CommentDTO)o;
			return rNo == c.rNo;
		}
		return false;
	}



	public void validate(Map<String, Boolean> errors) {
		if (content == null || content.trim().isEmpty()) {
			errors.put(content, Boolean.TRUE);
		}
	}

}
