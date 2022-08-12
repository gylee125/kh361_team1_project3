package com.mealkit.order;

public class CartDTO {
	
	private String mId;
	private int ucId;
	
	
	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public int getUcId() {
		return ucId;
	}


	public void setUcId(int ucId) {
		this.ucId = ucId;
	}


	@Override
	public String toString() {
		return "CartDTO [mId=" + mId + ", ucId=" + ucId + "]";
	}
	
	
}
