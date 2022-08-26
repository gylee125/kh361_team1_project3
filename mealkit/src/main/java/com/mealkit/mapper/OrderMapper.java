package com.mealkit.mapper;

import java.util.List;

import com.mealkit.order.CartVO;
import com.mealkit.order.OrderCriteria;
import com.mealkit.order.OrderCriteriaUser;
import com.mealkit.order.OrderVO;

public interface OrderMapper {
	
	public void addOrder (String mId) throws Exception;
	
	public OrderVO orderDetail (int oId) throws Exception;
	
	public List<OrderVO> showOrderList (String mId) throws Exception;
	
	public int countPageOrder (OrderCriteriaUser cri) throws Exception;
	
	
	public void addCart (CartVO cart) throws Exception;
	
	public List<CartVO> showCart (String mId) throws Exception;
	
	public int checkProduct(CartVO cart);
	
	public CartVO selectOne (int ucId) throws Exception;
	
	public void update (int ucId, int cquantity) throws Exception;
	
	public void delete (int ucId) throws Exception;
	
	public void resetCart (String mId) throws Exception;
	
	
	public List<OrderVO> orderAdmin() throws Exception;
	
	public void updateAdmin (int oId,int statusCode) throws Exception;
	
	public void deleteAdmin (int oId) throws Exception;

	public OrderVO detailAdmin(int oId) throws Exception;
	
	// 검색기능
	public List<OrderVO> selectOrderList(OrderCriteria cri) throws Exception;

    public int countPage(OrderCriteria cri) throws Exception;

}
