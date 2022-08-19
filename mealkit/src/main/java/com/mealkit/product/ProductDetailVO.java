package com.mealkit.product;

import lombok.Data;

@Data
public class ProductDetailVO {

    private int pId;
    private String typeCode;
    private String pName;
    private int price;
    private int stock;
    private String brand;
    private String description;
    private String thumbnail;
    private String image;
    private String tName;
    private String tNameEng;

    
}
