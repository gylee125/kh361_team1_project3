package com.mealkit.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mealkit.product.ProductDTO;
import com.mealkit.product.ProductService;

public class IndexHandler implements CommandHandler {
	ProductService productService = ProductService.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		
		List<ProductDTO> productList = productService.show6Product();
        req.setAttribute("productList", productList);
		
		return "/WEB-INF/view/index.jsp";
	}

}
