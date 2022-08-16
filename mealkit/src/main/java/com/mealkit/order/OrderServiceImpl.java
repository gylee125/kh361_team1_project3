package com.mealkit.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealkit.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	
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

	
	
	@Override
	public List<OrderVO> orderAdmin() throws Exception {
		return orderMapper.orderAdmin();
	}

	
	@Override
	public void updateAdmin (int oId, int statuscode) throws Exception {
		orderMapper.updateAdmin(oId, statuscode);
	}
	
	@Override
	public void deleteAdmin (int oId) throws Exception{
		orderMapper.deleteAdmin(oId);
	}


}
