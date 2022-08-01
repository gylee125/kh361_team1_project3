package model.dto;

//비회원 장바구니
public class NuserCartDTO {
    
    private int ncId;
    private int pId;
    private int quantity;
    
    // 외래키로 받아올 데이터때문에 추가
    private String pName;
    private int price;
    private String thumbnail;
    
    public int getNcId() {
        return ncId;
    }
    public void setNcId(int ncId) {
        this.ncId = ncId;
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
