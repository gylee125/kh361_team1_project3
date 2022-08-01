package mvc.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.CommentListService;

import model.service.ReviewPage;
import model.dto.MemberDTO;
import model.dto.ProductDTO;
import model.dto.ProductDetailDTO;
import model.service.ProductService;

public class ProductHandler implements CommandHandler {

	ProductService productService = ProductService.getInstance();
    //
    CommentListService commentService = new CommentListService();
    //
    
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {

		String fromPath = req.getRequestURI().substring(req.getContextPath().length());
		String toPath = null;

		if (fromPath.equals("/shop/all.do")) {

			List<ProductDTO> productList = productService.showProductList();
			req.setAttribute("productList", productList);

			toPath = "/WEB-INF/view/shop/listAll.jsp";

		} else if (fromPath.equals("/shop/search.do")) {
			String keyword = req.getParameter("searchKeyword");
			List<ProductDTO> productList = productService.searchProduct(keyword);
			req.setAttribute("productList", productList);

			toPath = "/WEB-INF/view/shop/listSearch.jsp";

		} else if (fromPath.equals("/shop/type.do")) {

			String typeCode = req.getParameter("typeCode");
			List<ProductDTO> productListByTypeCode = productService.showProductListByTypeCode(typeCode);
			req.setAttribute("productList", productListByTypeCode);

			toPath = "/WEB-INF/view/shop/listAll.jsp";

		} else if (fromPath.equals("/shop/detail.do")) {

			int pId = Integer.parseInt(req.getParameter("pId"));
			ProductDetailDTO productOne = productService.showProductDetail(pId);
			List<ProductDTO> relatedList = productService.showRelatedList(pId);
			req.setAttribute("productOne", productOne);
			req.setAttribute("relatedList", relatedList);
			
            //merge
            HttpSession session = req.getSession();
            session.removeAttribute("pId");
            session.setAttribute("pId", pId);
            System.out.println("productdetailCalled-castSession.attribute.mId:"+req.getSession().getAttribute("mId"));
            req.setAttribute("pId", pId);
            ReviewPage reviewPage = commentService.getReviewPage(pId);
    		req.setAttribute("reviewPage", reviewPage); 
            //
			
			toPath = "/WEB-INF/view/shop/productDetail.jsp";
		} else if (fromPath.equals("/insertProduct.do")) {

			toPath = "WEB-INF/view/shop/productInsert.jsp";

		} else if (fromPath.equals("/submitInsert.do")) {

			ProductDTO product = new ProductDTO();
			
			product.setTypeCode(req.getParameter("typeCode"));
			product.setpName(req.getParameter("pName"));
			product.setPrice(Integer.parseInt(req.getParameter("price")));
			product.setStock(Integer.parseInt(req.getParameter("stock")));
			product.setBrand(req.getParameter("brand"));
			product.setDescription(req.getParameter("description"));
			product.setThumbnail(req.getParameter("thumbnail"));
			product.setImage(req.getParameter("image"));
			
			productService.insert(product);

			req.setAttribute("msg", "상품등록 완료");
			req.setAttribute("url", "index.do");

			toPath = "WEB-INF/view/alert.jsp";

		}
		return toPath;
	}
}
