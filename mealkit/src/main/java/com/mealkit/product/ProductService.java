package com.mealkit.product;

import java.util.List;

public interface ProductService {
	List<ProductVO> selectProductList() throws Exception;
	
	ProductDetailVO selectProductDetail(int pId) throws Exception;
	
	List<ProductVO> selectNewProductList() throws Exception;
	
	List<ProductVO> selectRelatedList(int pId) throws Exception;
	
	ProductVO selectByPId(int pId) throws Exception;
	
	List<ProductVO> selectByTypeCode(String typeCode) throws Exception;
	
	void insert(ProductVO product) throws Exception;
	
	void updateProduct(ProductVO product) throws Exception;
	
	int delete(int pId) throws Exception;
	
	List<ProductVO> selectListWithPaging(Criteria cri) throws Exception;

	int listCountCriteria(Criteria cri) throws Exception;
	
	List<ProductVO> search(String keyword) throws Exception;
}
