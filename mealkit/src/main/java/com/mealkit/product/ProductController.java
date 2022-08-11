package com.mealkit.product;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/product")
public class ProductController{
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService productService;
	
	//@Inject
	//private CommentListService commentService;
	
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void productListPage(@ModelAttribute("cri") ProductCriteria cri, Model model) throws Exception {
		logger.info("/product/listAll");
		logger.info(cri.toString());

	    model.addAttribute("productList", productService.selectListWithPaging(cri));
	    ProductPageMaker pageMaker = new ProductPageMaker();
	    pageMaker.setCri(cri);
	    // pageMaker.setTotalCount(131);

	    pageMaker.setTotalCount(productService.listCountCriteria(cri));

	    model.addAttribute("pageMaker", pageMaker);
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
		logger.info("/product/detail" + pId);
		
		ProductDetailVO productOne = productService.selectProductDetail(pId);
		List<ProductVO> relatedList = productService.selectRelatedList(pId);
		
		logger.info("// productOne.toString()=" + productOne.toString());
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
	
	@RequestMapping(value = "/search", method=RequestMethod.GET)
	public void search(Model model, @RequestParam(value = "keyword") String keyword) throws Exception {
		logger.info("/product/search -> '" + keyword + "' 검색");
		
		List<ProductVO> productList = productService.search(keyword);
		
		logger.info("// productList.toString()=" + productList.toString());
		model.addAttribute("productList", productList);
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public void registerGET(HttpServletRequest request, ProductVO product, Model model) throws Exception {
		logger.info("// /product/register get호출");
	}
	
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String registerPost(HttpServletRequest request, ProductVO product) throws Exception {
		logger.info("// /product/register post호출");
		
		productService.insert(product);
		logger.info("// product.toString()=" + product.toString());
		
		request.setAttribute("msg", "상품등록 완료");
        request.setAttribute("url", "listAll"); 
        
		return "alert";
		
	}
	
	@RequestMapping(value = "/listAdmin")
	public void productListAdmin(HttpServletRequest request, Model model) throws Exception {
		logger.info("/product/listAdmin");
		
		List<ProductVO> productList = productService.selectProductList();
		
		logger.info("// productList.toString()=" + productList.toString());
		model.addAttribute("productList", productList);
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public void updateGET(HttpServletRequest request, @RequestParam(value = "pId") int pId, Model model) throws Exception {
		logger.info("/product/update get 호출 pId=" + pId);
		
		ProductDetailVO productOne = productService.selectProductDetail(pId);
		model.addAttribute("productOne", productOne);
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String updatePOST(HttpServletRequest request, ProductVO product, Model model) throws Exception {
		logger.info("/product/update post 호출");
		
		int pId = product.getpId();
		
		productService.updateProduct(product);
				
		ProductDetailVO productOne = productService.selectProductDetail(pId);
		logger.info("// productList.toString()=" + productOne.toString());
		
		request.setAttribute("msg", "상품수정 완료");
        request.setAttribute("url", "detail?pId="+pId ); 
        
		return "alert";
	}
	
	@RequestMapping(value = "/delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, @RequestParam(value = "pId") int pId) throws Exception {
		logger.info("/product/delete pId=" + pId);
		
		request.setAttribute("msg", "상품삭제 완료");
        request.setAttribute("url", "listAll" ); 
        
        productService.delete(pId);
        
        return "alert";

	}
}
