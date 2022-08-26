package com.mealkit.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealkit.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	

	@Autowired
	private OrderMapper orderMapper;

	// 주문
	@Override
	public List<OrderVO> showOrderList (String mId) throws Exception {
	 return orderMapper.showOrderList(mId); 
	 }
	
	@Override
	public void addOrder(String mId) throws Exception {
		orderMapper.addOrder(mId);
	}
	
	@Override
	public OrderVO orderDetail(int oId) throws Exception {
		return orderMapper.orderDetail(oId);
	}
	
	@Override
	public int countPageOrder(OrderCriteriaUser cri) throws Exception {
		return orderMapper.countPageOrder(cri);
	}

	
	// 장바구니
	@Override
	public void addCart(CartVO cart) throws Exception {
		orderMapper.addCart(cart);
	}

	@Override
	public List<CartVO> showCart(String mId) throws Exception {
		return orderMapper.showCart(mId);
	}

	@Override
	public int checkProduct(CartVO cart) {

		return orderMapper.checkProduct(cart);
	}
	
	@Override
	public CartVO selectOne(int ucId) throws Exception {
		return orderMapper.selectOne(ucId);
	}

	@Override
	public void update(int ucId, int cquantity) throws Exception {
		orderMapper.update(ucId, cquantity);

	}

	@Override
	public void delete(int ucId) throws Exception {
		orderMapper.delete(ucId);
	}
	
	@Override
	public void resetCart(String mId) throws Exception {
		orderMapper.resetCart(mId);
	}

	
	
	// 관리자
	@Override
	public List<OrderVO> orderAdmin() throws Exception {
		return orderMapper.orderAdmin();
	}
	
	@Override
	public void updateAdmin (int oId, int statusCode) throws Exception {
		orderMapper.updateAdmin(oId, statusCode);
	}
	
	@Override
	public void deleteAdmin (int oId) throws Exception{
		orderMapper.deleteAdmin(oId);
	}
	
	public OrderVO detailAdmin(int oId) throws Exception{
		return orderMapper.detailAdmin(oId);
	}

	@Override
	public List<OrderVO> selectOrderList(OrderCriteria cri) throws Exception {
		return orderMapper.selectOrderList(cri);
	}

	@Override
	public int countPage(OrderCriteria cri) throws Exception {
		return orderMapper.countPage(cri);
	}
	

}
