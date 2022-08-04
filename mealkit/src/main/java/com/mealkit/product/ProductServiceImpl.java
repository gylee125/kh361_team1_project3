package com.mealkit.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealkit.mapper.ProductMapper;
import com.mealkit.product.ProductVO;
import com.mealkit.product.ProductDetailVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	@Transactional
	public List<ProductVO> selectProductList() throws Exception {
		return productMapper.selectProductList();
	}

	@Override
	@Transactional
	public ProductDetailVO selectProductDetail(int pId) throws Exception {
		return productMapper.selectProductDetail(pId);
	}

	@Override
	@Transactional
	public List<ProductVO> selectNewProductList() throws Exception {
		return productMapper.selectNewProductList();
	}

	@Override
	@Transactional
	public List<ProductVO> selectRelatedList(int pId) throws Exception {
		return productMapper.selectRelatedList(pId);
	}

	@Override
	@Transactional
	public ProductVO selectByPId(int pId) throws Exception {
		return productMapper.selectByPId(pId);
	}

	@Override
	@Transactional
	public List<ProductVO> selectByTypeCode(String typeCode) throws Exception {
		return productMapper.selectByTypeCode(typeCode);
	}
	
	@Override
	@Transactional
	public void insert(ProductVO product) throws Exception {
		productMapper.insert(product);
	}

	@Override
	@Transactional
	public void updateProduct(int pId) throws Exception {
		productMapper.updateProduct(pId);
	}

	@Override
	@Transactional
	public int delete(int pId) throws Exception {
		return productMapper.delete(pId);
	}

	

}
