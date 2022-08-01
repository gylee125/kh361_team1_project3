package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.dto.CommentDTO;
import jdbc.JdbcUtil;
import model.dto.CartDTO;

public class CartDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	private static CartDAO cartDAO = new CartDAO();

	public CartDAO() {
	}

	public static CartDAO getInstance() {
		return cartDAO;
	}
	
	private CartDTO makeCartFromResultSet(ResultSet rs) throws SQLException {

	    CartDTO cartDTO = new CartDTO();

	    cartDTO.setUcId(rs.getInt("ucId"));
	    cartDTO.setmId("mId");
	    cartDTO.setpId(rs.getInt("pId"));
	    cartDTO.setCquantity(rs.getInt("cquantity"));   
		cartDTO.setpName(rs.getString("pName"));
		cartDTO.setPrice(rs.getInt("price"));
		cartDTO.setThumbnail(rs.getString("thumbnail"));

        return cartDTO;
    }
	
	public void addCart(Connection conn, CartDTO cartDTO) throws SQLException {	
        PreparedStatement pstmt = null;   
        
        pstmt = conn.prepareStatement("INSERT INTO USERCART"
        		+ "(ucId,mId,pId,cquantity)" 
        		+ "VALUES(UCIDSEQ.nextval,?,?,?)");

        pstmt.setString(1, cartDTO.getmId());
        pstmt.setInt(2, cartDTO.getpId());
        pstmt.setInt(3, cartDTO.getCquantity());
        
        pstmt.executeUpdate();  
	}
	
	public List<CartDTO> showCart(Connection conn, String mId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select a.ucId, a.pId, a.cquantity, b.pName, b.price, b.thumbnail "
                    + "from usercart a, product b "
                    + "where a.pid = b.pid "
                    + "and mId=?");
			pstmt.setString(1, mId);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				List<CartDTO> cartList = new ArrayList<CartDTO>();
				
				do {
					cartList.add(makeCartFromResultSet(rs));
				} while (rs.next());
				
				return cartList;
			} else {
				
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int checkProduct(CartDTO cartDto) {
		int result = 0;
		try {
			sql = "select * from usercart" +
					"where ucId=? and mId=? and pId=? and cquantity=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartDto.getUcId());
			pstmt.setString(2, cartDto.getmId());
	        pstmt.setInt(3, cartDto.getpId());
	        pstmt.setInt(4, cartDto.getCquantity());
			pstmt.executeUpdate();
			
			if(rs.next()) { //중복 상품일 경우
				result = 1;
				// 구매수량 수정
				sql = "update usercart set cquantity = ?";
				pstmt.setInt(4, cartDto.getCquantity());
				pstmt.executeUpdate();
			}
			sql = "insert into usercart";
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return result;
	}
	
	private CartDTO convertCart(ResultSet rs) throws SQLException {
		return new CartDTO();
		
	}
	
	// 장바구니 수량 변경
	// 오류날 시 파라미터를 CartDTO로 변경
	public void update(Connection conn, int ucId, int cquantity) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt =  conn.prepareStatement(
					"update usercart set cquantity = ? where ucId = ?");
			// pstmt.setInt(1, pId);
			pstmt.setInt(1, cquantity);
			pstmt.setInt(2, ucId);
			pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	
	public void delete(Connection conn, int ucId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"delete from usercart where ucId = ?");
			pstmt.setInt(1,ucId);
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	
	
}