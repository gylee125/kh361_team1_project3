package com.mealkit.member;

import java.util.Date;

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
	private Date regDate;
	private int mLevel;
	
}
