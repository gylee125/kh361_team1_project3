package com.mealkit.main;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mealkit.product.ProductServiceImpl;
import com.mealkit.product.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	 private ProductServiceImpl productService;
	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String index(HttpServletRequest request, Model model) throws Exception {

		List<ProductVO> productList = productService.selectNewProductList();
		
		model.addAttribute("productList", productList);
		logger.info("/index");
		
		return "index";
	}
	
	@RequestMapping(value = "/home") // alert.jsp 기능쓰고 메인화면갈 때 쓰려고 만듬
	public String home(HttpServletRequest request, Model model) throws Exception {
		List<ProductVO> productList = productService.selectNewProductList();
		model.addAttribute("productList", productList);
		logger.info("/index");
		return "index";
	}
	
	
	@RequestMapping(value = "/about")
	public String about() throws Exception {
		logger.info("/about");
		
		return "about";
	}
	
}
