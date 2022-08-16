package com.mealkit.order;

import java.util.List;

public interface OrderService {

	public void addOrder(String mId) throws Exception;

	public List<OrderVO> showOrderList(String mId) throws Exception;
	
	public OrderVO orderDetail (int oId) throws Exception;
	
	
	public void addCart (CartVO cart) throws Exception;
	
	public List<CartVO> showCart (String mId) throws Exception;
	
	public int checkProduct(CartVO cart);
	
	public CartVO selectOne (int ucId) throws Exception;
	
	public void update (int ucId, int cquantity) throws Exception;
	
	public void delete (int ucId) throws Exception;
	
	public void resetCart (String mId) throws Exception;
	
	
	public List<OrderVO> orderAdmin() throws Exception;
	
	public void updateAdmin (int oId, int statuscode) throws Exception;
	
	public void deleteAdmin (int oId) throws Exception;


}
