package com.mealkit.product;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mealkit.board.CommentListService;
import com.mealkit.board.ReviewPage;

@Controller
@RequestMapping(value = "/product")
public class ProductController{
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService productService;
	
	//@Inject
	private CommentListService commentService;
	
	
	@RequestMapping(value = "/listAll")
	public void productList(HttpServletRequest request, Model model) throws Exception {
		logger.info("/product/listAll");
		
		List<ProductVO> productList = productService.selectProductList();
		
		logger.info("// productList.toString()=" + productList.toString());
		model.addAttribute("productList", productList);
	}
	
	@RequestMapping(value = "/listType")
	public void productListType(Model model, @RequestParam(value = "typeCode") String typeCode) throws Exception {
		logger.info("/product/listType" + typeCode);
		
		List<ProductVO> productList = productService.selectByTypeCode(typeCode);
		
		logger.info("// productList.toString()=" + productList.toString());
		model.addAttribute("productList", productList);
	}
	
	@RequestMapping(value = "/detail")
	public void productDetail(Model model, @RequestParam(value = "pId") int pId, HttpServletRequest request) throws Exception {
		logger.info("/product/detail");
		
		ProductDetailVO productOne = productService.selectProductDetail(pId);
		List<ProductVO> relatedList = productService.selectRelatedList(pId);
		model.addAttribute("productOne", productOne);
		model.addAttribute("relatedList", relatedList);
		
        /*
        //merge
        HttpSession session = request.getSession();
        session.removeAttribute("pId");
        session.setAttribute("pId", pId);
        System.out.println("productdetailCalled-castSession.attribute.mId:"+request.getSession().getAttribute("mId"));
        request.setAttribute("pId", pId);
        ReviewPage reviewPage = commentService.getReviewPage(pId);
        request.setAttribute("reviewPage", reviewPage); 
        */
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public void registerGET(ProductVO product, Model model) throws Exception {
		logger.info("// /product/register get호출");
		
	}
	
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String registerPost(HttpServletRequest request, ProductVO product) throws Exception {
		logger.info("// /product/register post호출");
		
		productService.insert(product);
		logger.info("// product.toString()=" + product.toString());
		
		request.setAttribute("msg", "상품등록 완료");
        request.setAttribute("url", "index"); 
        
		return "alert";
		
	}
	
	
	/* 검색은 좀더 찾아보고 구현
	@RequestMapping(value = "/listSearch")
	public void search(HttpServletRequest request, ProductVO product) throws Exception {
		logger.info("// /product/listSearch");
		
		String keyword = req.getParameter("searchKeyword");
		List<ProductVO> productList = productService.searchProduct(keyword);		
		logger.info("// productList.toString()=" + productList.toString());
		model.addAttribute("productList", productList);
		
	}*/

}
