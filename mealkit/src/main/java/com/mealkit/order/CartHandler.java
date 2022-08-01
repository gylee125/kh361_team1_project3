package mvc.command;

import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CartDAO;
import model.dto.CartDTO;
import model.service.CartService;

public class CartHandler implements CommandHandler {

	CartService cartService = CartService.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String fromPath = req.getRequestURI().substring(req.getContextPath().length());
		String toPath =  null;

		if (fromPath.equals("/cart.do")) {
			String mId = req.getParameter("mId");

			List<CartDTO> cartList = cartService.showCart(mId);
			req.setAttribute("cartList", cartList);
			toPath = "/WEB-INF/view/order/cart.jsp";

		} else if (fromPath.equals("/emptyCart.do")) {

//			req.setAttribute("msg", "장바구니가 비어있습니다");
//			req.setAttribute("url", "/WEB-INF/view/empty-cart.jsp");
			toPath = "/WEB-INF/view/order/empty-cart.jsp";

		} else if (fromPath.equals("/notLoginCart.do")) {

			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("url", "login.do");
			toPath = "/WEB-INF/view/alert.jsp";

		}else if (fromPath.equals("/addCart.do")) {

			CartDTO cartDTO = new CartDTO();

			String mId = req.getParameter("mId");
			int pId = Integer.parseInt(req.getParameter("pId"));
			int cquantity = Integer.parseInt(req.getParameter("cquantity"));

			cartDTO.setmId(mId);
			cartDTO.setpId(pId);
			cartDTO.setCquantity(cquantity);
			cartService.addCart(cartDTO);

			req.setAttribute("msg", "장바구니에 상품을 추가하였습니다.");
			req.setAttribute("url", "cart.do?mId=" + mId);
			toPath = "/WEB-INF/view/alert.jsp";


		} else if (fromPath.equals("/updateCart.do")) {

			int ucId = Integer.parseInt(req.getParameter("ucId"));
			int cquantity = Integer.parseInt(req.getParameter("cquantity"));
			cartService.update(ucId, cquantity);

			req.setAttribute("msg", "상품 수량을 수정하였습니다.");
			req.setAttribute("url", "cart.do");
			toPath = "/WEB-INF/view/alert.jsp";


		} else if (fromPath.equals("/deleteCart.do")) {

			int ucId = Integer.parseInt(req.getParameter("ucId"));
			cartService.delete(ucId);

			String mId = req.getParameter("mId"); // mId 유지 어떻게 하지?

			req.setAttribute("msg", "상품을 삭제하였습니다.");
			req.setAttribute("url", "cart.do?mId=" + mId);

			toPath = "/WEB-INF/view/alert.jsp";
		} else {
			toPath ="/WEB-INF/view/error.jsp";
		}

		return toPath;
	}

}