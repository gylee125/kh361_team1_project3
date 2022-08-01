package model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.dao.CartDAO;
import model.dto.CartDTO;

public class CartService {

	private static CartService instance = new CartService();

	public static CartService getInstance() {
		return instance;
	}

	private CartService() {
	}

	public List<CartDTO> showCart(String mId){
		Connection conn = null ; 
		try {
			conn = ConnectionProvider.getConnection();
			CartDAO cartDAO = CartDAO.getInstance();

			return cartDAO.showCart(conn, mId);
		} catch (SQLException e) {
			JdbcUtil.printSQLException(e);
			JdbcUtil.close(conn);
		}
		return null;
	}

	public void addCart(CartDTO cartDTO) {
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			CartDAO cartDAO = CartDAO.getInstance();

			cartDAO.addCart(conn, cartDTO);

		} catch (SQLException e) {
			JdbcUtil.printSQLException(e);
			JdbcUtil.close(conn);
		}
	}

	public void update ( int ucId, int cquantity) {

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			CartDAO cartDAO = CartDAO.getInstance();

			cartDAO.update(conn, ucId, cquantity);
		} catch (SQLException e) {
			JdbcUtil.printSQLException(e);
			JdbcUtil.close(conn);
		}
	}

	public void delete (int ucId) {

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			CartDAO cartDAO = CartDAO.getInstance();

			cartDAO.delete(conn, ucId);
		} catch (SQLException e) {
			JdbcUtil.printSQLException(e);
			JdbcUtil.close(conn);
		}
	}

}