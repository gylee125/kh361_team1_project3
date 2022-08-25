package com.mealkit.order;

//서브 파일이다 원본파일이랑 구분 잘해라!!!

import java.util.Date;

public class OrderListVO {
	
	public OrderListVO() {}
	
	
	private int oId;
	private String mId;
	private int pId;
	private int quantity;
	private Date oDate;
	private int price;
	private String statusCode;
	
	// 주문페이지 위해서 상품명 추가
	private String pName;
	private String statusName;
	
	// 관리자 주문상세를 위해 회원정보 추가
	private String mName;
	private String phone;
	private String address;
	
	
	
}