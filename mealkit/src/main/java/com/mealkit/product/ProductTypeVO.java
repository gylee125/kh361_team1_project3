package com.mealkit.product;

public class ProductTypeVO {

    private String typeCode;
    private String tName;
    private String tNameEng;

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettNameEng() {
        return tNameEng;
    }

    public void settNameEng(String tNameEng) {
        this.tNameEng = tNameEng;
    }

	@Override
	public String toString() {
		return "ProductTypeVO [typeCode=" + typeCode + ", tName=" + tName + ", tNameEng=" + tNameEng + "]";
	}
    
}
