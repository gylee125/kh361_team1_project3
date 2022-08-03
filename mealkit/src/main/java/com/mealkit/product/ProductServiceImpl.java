package com.mealkit.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealkit.mapper.ProductMapper;
import com.mealkit.product.ProductVO;
import com.mealkit.product.ProductDetailVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	@Transactional
	public List<ProductVO> selectProductList() throws Exception {
		return productMapper.selectProductList();
	}

	@Override
	@Transactional
	public ProductDetailVO selectJoinByPId(int pId) throws Exception {
		return productMapper.selectJoinByPId(pId);
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
	public int updatePName(int pId, String pName) throws Exception {
		return productMapper.updatePName(pId, pName);
	}

	@Override
	@Transactional
	public int updatePrice(int pId, int price) throws Exception {
		return productMapper.updatePrice(pId, price);
	}

	@Override
	@Transactional
	public int delete(int pId) throws Exception {
		return productMapper.delete(pId);
	}

	

}
