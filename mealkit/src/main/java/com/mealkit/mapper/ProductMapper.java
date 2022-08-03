package com.mealkit.mapper;

import java.util.List;

import com.mealkit.product.ProductDetailVO;
import com.mealkit.product.ProductVO;

public interface ProductMapper {
	List<ProductVO> selectProductList() throws Exception;
	
	ProductDetailVO selectJoinByPId(int pId) throws Exception;
	
	List<ProductVO> selectNewProductList() throws Exception;
	
	List<ProductVO> selectRelatedList(int pId) throws Exception;
	
	ProductVO selectByPId(int pId) throws Exception;
	
	List<ProductVO> selectByTypeCode(String typeCode) throws Exception;
	
	void insert(ProductVO product) throws Exception;
	
	int updatePName(int pId, String pName) throws Exception;
	
	int updatePrice(int pId, int price) throws Exception;
	
	int delete(int pId) throws Exception;
	
}
