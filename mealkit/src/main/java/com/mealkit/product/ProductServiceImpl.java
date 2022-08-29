package com.mealkit.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mealkit.mapper.ProductMapper;

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
	public List<ProductVO> selectByTypeCode(String typeCode) throws Exception {
		return productMapper.selectByTypeCode(typeCode);
	}
	
	@Override
	@Transactional
	public ProductTypeVO selectTypeByTypeCode(String typeCode) throws Exception {
		return productMapper.selectTypeByTypeCode(typeCode);
	};

	@Override
	@Transactional
	public void insert(ProductVO product) throws Exception {
		productMapper.insert(product);
	}

	@Override
	@Transactional
	public void updateProduct(ProductVO product) throws Exception {
		productMapper.updateProduct(product);
	}

	@Override
	@Transactional
	public int delete(int pId) throws Exception {
		return productMapper.delete(pId);
	}

	@Override
	@Transactional
	public List<ProductVO> selectListWithPaging(ProductCriteria cri) throws Exception {
		return productMapper.selectListWithPaging(cri);
	}

	@Override
	@Transactional
	public int listCountCriteria(ProductCriteria cri) throws Exception {

		return productMapper.countPaging(cri);
	}

	@Override
	@Transactional
	public List<ProductVO> search(String keyword) throws Exception {
		return productMapper.search(keyword);
	}
	
	@Override
	@Transactional
	public List<ProductVO> adminListSearch(ProductSearchCriteria cri) throws Exception{
		cri.setPerPageNum(10);
		return productMapper.adminListSearch(cri);
	};
	
	@Override
	@Transactional
	public int adminListSearchCount(ProductSearchCriteria cri) throws Exception{
		cri.setPerPageNum(10);
		return productMapper.adminListSearchCount(cri);
	};
}
