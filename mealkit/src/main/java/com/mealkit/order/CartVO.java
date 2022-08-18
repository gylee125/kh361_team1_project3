package com.mealkit.order;

public class CartVO {
	private int ucId;
	private String mId;
	private int pId;
	private int cquantity;
	
	
	public CartVO() {
		this.ucId = ucId;
		this.mId = mId;
		this.pId = pId;
		this.cquantity = cquantity;	
		this.pName = pName;
		this.price = price;
		this.thumbnail = thumbnail; 
		
	}
	
	
	
	public int getUcId() {
		return ucId;
	}


	public void setUcId(int ucId) {
		this.ucId = ucId;
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


	public int getCquantity() {
		return cquantity;
	}


	public void setCquantity(int cquantity) {
		this.cquantity = cquantity;
	}

	

	@Override
	public String toString() {
		return "CartVO [ucId=" + ucId + ", mId=" + mId + ", pId=" + pId + ", cquantity=" + cquantity + ", pName="
				+ pName + ", price=" + price + ", thumbnail=" + thumbnail + "]";
	}



	private ProductVO productVO;
	
	private String pName;
	private int price;
	private String thumbnail;


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getThumbnail() {
		return thumbnail;
	}


	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
}
