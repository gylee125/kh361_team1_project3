package com.mealkit.mapper;

import java.util.List;

import com.mealkit.product.ProductDetailVO;
import com.mealkit.product.ProductSearchCriteria;
import com.mealkit.product.ProductTypeVO;
import com.mealkit.product.ProductVO;
import com.mealkit.product.ProductCriteria;

public interface ProductMapper {
		
	List<ProductVO> selectProductList() throws Exception;
	
	ProductDetailVO selectProductDetail(int pId) throws Exception;
	
	List<ProductVO> selectNewProductList() throws Exception;
	
	List<ProductVO> selectRelatedList(int pId) throws Exception;
	
	List<ProductVO> selectByTypeCode(String typeCode) throws Exception;
	
	ProductTypeVO selectTypeByTypeCode(String typeCode) throws Exception;
	
	List<ProductVO> selectListWithPaging(ProductCriteria cri) throws Exception;
	
	int countPaging(ProductCriteria cri) throws Exception;
	
	void insert(ProductVO product) throws Exception;
	
	int updateProduct(ProductVO product) throws Exception;
	
	int delete(int pId) throws Exception;
	
	List<ProductVO> search(String keyword) throws Exception;
	
	List<ProductVO> adminListSearch(ProductSearchCriteria cri) throws Exception;
	
	int adminListSearchCount(ProductSearchCriteria cri) throws Exception;
	
}
