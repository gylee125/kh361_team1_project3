package mvc.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dto.OrderDTO;
import model.dto.CartDTO;
import model.service.OrderService;

public class OrderHandler implements CommandHandler {

	OrderService orderService = OrderService.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {

		String fromPath = req.getRequestURI().substring(req.getContextPath().length());
		String toPath = null;

		if (fromPath.equals("/cart.do")) {

			String mId = req.getParameter("mId");
			List<CartDTO> cartList = orderService.showCart(mId);
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

		} else if (fromPath.equals("/addCart.do")) {

			CartDTO cart = new CartDTO();

			String mId = req.getParameter("mId");
			int pId = Integer.parseInt(req.getParameter("pId"));
			int cquantity = Integer.parseInt(req.getParameter("cquantity"));

			cart.setmId(mId);
			cart.setpId(pId);
			cart.setCquantity(cquantity);
			orderService.addCart(cart);

			req.setAttribute("msg", "상품을 장바구니에 넣었습니다.");
			req.setAttribute("url", "cart.do?mId=" + mId);
			toPath = "/WEB-INF/view/alert.jsp";

		} else if (fromPath.equals("/deleteCart.do")) {

			String mId = req.getParameter("mId");
			int ucId = Integer.parseInt(req.getParameter("ucId"));
			orderService.deleteCart(ucId);
			
			req.setAttribute("msg", "상품을 삭제하였습니다.");
			req.setAttribute("url", "cart.do?mId=" + mId);
			toPath = "/WEB-INF/view/alert.jsp";

		} else if (fromPath.equals("/checkout.do")) {

			String mId = req.getParameter("mId");
			List<CartDTO> cartList = orderService.showCart(mId);
			req.setAttribute("cartList", cartList);

			toPath = "/WEB-INF/view/order/checkout.jsp";

		} else if (fromPath.equals("/confirmation.do")) {

			toPath = "/WEB-INF/view/order/confirmation.jsp";

		} else if (fromPath.equals("/order.do")) {

			String mId = req.getParameter("mId");
			List<OrderDTO> orderList = orderService.showOrderList(mId);
			req.setAttribute("orderList", orderList);

			toPath = "/WEB-INF/view/order/order.jsp";

		} else if (fromPath.equals("/addOrder.do")) {

			String mId = req.getParameter("mId");
			orderService.addOrder(mId);
			orderService.resetCart(mId);

			// req.setAttribute("msg", "주문이 완료되었습니다.");
			// req.setAttribute("url", "order.do?mId=" + mId);
			toPath = "/WEB-INF/view/order/confirmation.jsp";

		} else if (fromPath.equals("/orderDetail.do")) {

			String mId = req.getParameter("mId");
			List<OrderDTO> orderList = orderService.showOrderList(mId);
			req.setAttribute("orderList", orderList);

			toPath = "/WEB-INF/view/order/order-detail.jsp";

		} else {
			toPath = "/WEB-INF/view/error.jsp";
		}

		return toPath;
	}

}