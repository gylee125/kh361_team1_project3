package com.mealkit.member;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberDTO {
	
	private int mNo;
	private String mId;
	private String pw;
	private String mName;
	private String phone;
	private String address;
	private String email;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private int mLevel;
	
	private PointDTO pointDTO;
	
}
