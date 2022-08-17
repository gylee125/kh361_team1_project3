package com.mealkit.order;

//서브 파일이다 원본파일이랑 구분 잘해라!!!

import java.util.Date;

public class OrderVO {
	
	public OrderVO() {}
	
	
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
	
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}	
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "OrderVO [oId=" + oId + ", mId=" + mId + ", pId=" + pId + ", quantity=" + quantity + ", oDate=" + oDate
				+ ", price=" + price + ", statusCode=" + statusCode + ", pName=" + pName + ", statusName=" + statusName
				+ ", mName=" + mName + ", phone=" + phone + ", address=" + address + "]";
	}
	
	
	
	
}