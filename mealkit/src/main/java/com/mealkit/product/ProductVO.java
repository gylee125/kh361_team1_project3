package com.mealkit.product;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	private int pId;
	private String typeCode;
	private String pName;
	private int price;
	private String brand;
	private String description;
	private String thumbnail;
	private String image;
	
	private MultipartFile uploadfile;
	
	
}
