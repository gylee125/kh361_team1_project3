package com.mealkit.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberListDTO {
	
	private int mNo;
	private String mId;
	private String mName;
	private String email;
	private Date regDate;
	private int currentPoint;
	
}
