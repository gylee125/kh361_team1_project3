package com.mealkit.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mealkit.main.HomeController;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/checkout.do")
	public String checkout(String mId, HttpServletRequest request, HttpSession session) throws Exception {
		List<CartVO> cartList = orderService.showCart(mId);
		session.setAttribute("cartList", cartList);
			
		return "order/checkout";
	}
	
	@RequestMapping(value="/order.do")
	public String order(String mId, HttpServletRequest request, HttpSession session) throws Exception {
		List<OrderVO> orderList = orderService.showOrderList(mId);
		
		if(!orderList.isEmpty()) {
			session.setAttribute("orderList", orderList);
		} else {
			// request.setAttribute("msg", "장바구니가 비었습니다.");
	        // request.setAttribute("url", "emptyCart.do"); 
			return "order/empty-order";
		}
		return "order/order";
	}
	
	@RequestMapping(value="/order-detail.do")
	public String orderDetail(int oId, HttpServletRequest request, HttpSession session) throws Exception {
		OrderVO orderDetail = orderService.orderDetail(oId);
		session.setAttribute("order", orderDetail);
		return "order/order-detail";
	}
	
	@RequestMapping(value = "/addOrder.do")
	public String addOrder(String mId, HttpServletRequest request, HttpSession session) throws Exception {
		orderService.addOrder(mId);
		orderService.resetCart(mId);
		session.setAttribute("mId", mId);
		request.setAttribute("msg", "주문목록에 상품이 추가됐습니다.");
		request.setAttribute("url", "confirmation.do");
		return "alert";
	}
	
	@RequestMapping(value="/confirmation.do")
	public String confirmation() {
		return "order/confirmation";
	}
	
	// @RequestMapping(value="/cart.do", method = RequestMethod.GET)
		// public void cart() {
		// }
		
		@RequestMapping(value="/cart.do")
		public String cart(String mId, HttpServletRequest request, HttpSession session) throws Exception {
			List<CartVO> cartList = orderService.showCart(mId);
			
			if(!cartList.isEmpty()) {
				session.setAttribute("cartList", cartList);
			} else {
				// request.setAttribute("msg", "장바구니가 비었습니다.");
		        // request.setAttribute("url", "emptyCart.do"); 
				return "order/empty-cart";
			}
			return "order/cart";
		}
		
		@RequestMapping(value="emptyCart.do")
		public String emptyCart() {
			return "order/empty-cart";
		}
		
		@RequestMapping(value="/notLoginCart.do")
		public String notLoginCart(HttpServletRequest request) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "login.do");
			return "alert";
		}
		
		/*
		 * @RequestMapping (value="/addCart.do", method = RequestMethod.GET) public void
		 * addCart() {
		 * 
		 * }
		 */
		
		@RequestMapping (value="/addCart.do")
		public String addCart(CartVO cart, HttpServletRequest request, HttpSession session) throws Exception {
			orderService.addCart(cart);
			String MId = request.getParameter("MId");
			session.setAttribute("cart", cart);
			request.setAttribute("msg", "장바구니에 상품이 추가됐습니다.");
	        request.setAttribute("url", "cart.do?mId="+MId); 
			return "alert";
		}
		
		/*
		 * @RequestMapping (value="/updateCart.do", method = RequestMethod.GET) public
		 * void update (@RequestParam("ucId") int ucId, int cquantity, Model
		 * model)throws Exception { CartVO cart = orderService.selectOne(ucId);
		 * model.addAttribute("cart", cart); }
		 */
		
		@RequestMapping (value="/updateCart.do")
		public String update( @RequestParam("ucId") int ucId, @RequestParam("cquantuity") int cquantity, HttpServletRequest request, HttpSession session) throws Exception {
			orderService.update(ucId, cquantity);
			session.setAttribute("ucId", ucId);
			session.setAttribute("cquantuty", cquantity);
			request.setAttribute("msg", "상품 수량이 수정되었습니다.");
	        request.setAttribute("url", "cart"); 
			return "alert";
		}
		
		/*
		 * @RequestMapping (value="/deleteCart.do", method = RequestMethod.GET) public
		 * void delete() { }
		 */
		
		@RequestMapping (value="/deleteCart.do")
		public String delete(int ucId, HttpServletRequest request, HttpSession session) throws Exception {
			orderService.delete(ucId);
			String mId = request.getParameter("mId");
			session.setAttribute("ucId", ucId);
			request.setAttribute("msg", "상품이 삭제 되었습니다.");
			request.setAttribute("url", "cart.do?mId="+mId);
			return "alert";
		}
		
		/*
		 * @RequestMapping(value = "/resetCart.do", method = RequestMethod.GET) public
		 * void resetCart() {
		 * 
		 * }
		 */

		@RequestMapping(value = "/resetCart.do")
		public String resetCart(String mId, HttpServletRequest request, HttpSession session) throws Exception {
			orderService.resetCart(mId);
			session.setAttribute("mId", mId);
			request.setAttribute("msg", "장바구니가 초기화 되었습니다.");
			request.setAttribute("url", "order");
			return "alert";

		}
		
		@RequestMapping (value="/updateAdmin.do")
		public String updateAdmin (@RequestParam("oId") int oId, @RequestParam("statusCode") int statusCode, Model model, HttpServletRequest request, HttpSession session) throws Exception {
			orderService.updateAdmin(oId, statusCode);	
			session.setAttribute("oId", oId);
			session.setAttribute("statusCode", statusCode);
			request.setAttribute("msg", "상품 정보가 수정 되었습니다.");
	        request.setAttribute("url", "orderAdmin.do"); 
			return "alert";
		}
		
		@RequestMapping(value="/orderAdmin.do")
		public String orderAdmin(Model model) throws Exception {
			List<OrderVO> orderList = orderService.orderAdmin();
			
			model.addAttribute("orderList",orderList);
			return "order/orderAdmin";
		}
		
		@RequestMapping (value="/deleteAdmin.do")
		public String deleteAdmin(int oId, HttpServletRequest request, HttpSession session) throws Exception {
			orderService.deleteAdmin(oId);
			session.setAttribute("oId", oId);
			request.setAttribute("msg", "상품이 삭제 되었습니다.");
	        request.setAttribute("url", "orderAdmin.do"); 
			return "alert";
		}
		
		@RequestMapping(value="/detailAdmin.do")
		public String detailAdmin(int oId, HttpServletRequest request, HttpSession session) throws Exception {
			OrderVO detailAdmin = orderService.detailAdmin(oId);
			session.setAttribute("order", detailAdmin);
			return "order/detailAdmin";
		}
		

}