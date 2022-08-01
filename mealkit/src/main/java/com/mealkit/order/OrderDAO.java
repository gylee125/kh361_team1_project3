package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import model.dto.OrderDTO;
import model.dto.CartDTO;

public class OrderDAO {
	
    private static OrderDAO orderDAO = new OrderDAO();	
	public static OrderDAO getInstance() {
		return orderDAO;
	}	
	private OrderDAO() {}
	
	private CartDTO makeUserCartFromResultSet(ResultSet rs) throws SQLException {
		
	    CartDTO userCart = new CartDTO();
        
	    userCart.setUcId(rs.getInt("ucId"));
	    userCart.setmId(rs.getString("mId"));
	    userCart.setpId(rs.getInt("pId"));	    
	    userCart.setCquantity(rs.getInt("cquantity"));	    
	    userCart.setpName(rs.getString("pName"));	    
	    userCart.setPrice(rs.getInt("price"));	    
	    userCart.setThumbnail(rs.getString("thumbnail"));	    
        
        return userCart;
    }	
	
	private OrderDTO makeOrderFromResultSet(ResultSet rs) throws SQLException {
        
        OrderDTO orderDTO = new OrderDTO();
        
        orderDTO.setoId(rs.getInt("oId"));
        orderDTO.setmId(rs.getString("mId"));
        orderDTO.setpId(rs.getInt("pId"));
        orderDTO.setQuantity(rs.getInt("quantity"));
        orderDTO.setoDate(rs.getDate("oDate"));
        orderDTO.setPrice(rs.getInt("price"));
        orderDTO.setStatusCode(rs.getString("statusCode"));
        orderDTO.setpName(rs.getString("pName"));
        orderDTO.setStatusName(rs.getString("statusName"));
        
        return orderDTO;
    }
	
	public List<CartDTO> showCart(Connection conn, String mId) throws SQLException {
	    
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = conn.prepareStatement("select a.ucId, a.mId, a.pId, a.cquantity, b.pName, b.price, b.thumbnail "
                    + "from userCart a, product b "
                    + "where a.mId=? and a.pid = b.pid "
                    + "order by ucId desc");
            pstmt.setString(1, mId);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                
                List<CartDTO> cartList = new ArrayList<CartDTO>();                
                do {
                    cartList.add(makeUserCartFromResultSet(rs));
                } while (rs.next());
                
                return cartList;
                
            }else {
                return Collections.emptyList();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
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
    
    public void deleteCart(Connection conn, int ucId) throws SQLException {
        
        PreparedStatement pstmt = null;        
        pstmt = conn.prepareStatement("delete from userCart where ucId=?");
        pstmt.setInt(1, ucId);
        pstmt.executeUpdate();
    }
    
	public void resetCart(Connection conn, String mId) throws SQLException {
		
		PreparedStatement pstmt = null;        
        pstmt = conn.prepareStatement("delete from userCart where mId=?");
        pstmt.setString(1, mId);
        pstmt.executeUpdate();
	}
        
	public List<OrderDTO> showOrderList(Connection conn, String mId) throws SQLException {
		
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = conn.prepareStatement("select a.oId, a.mId, a.pId, a.quantity, a.odate, a.price, a.statusCode, b.pName, c.statusName "
                    + "from userOrder a, product b, statusType c "
                    + "where a.mId=? "
                    + "and a.pid = b.pid "
                    + "and a.statusCode = c.statusCode "
                    + "order by oId desc");  
            
            pstmt.setString(1, mId);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                
                List<OrderDTO> orderList = new ArrayList<OrderDTO>();                
                do {
                	orderList.add(makeOrderFromResultSet(rs));
                } while (rs.next());
                
                return orderList;
                
            }else {
                return Collections.emptyList();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
	}
	
	public void addOrder(Connection conn, String mId) throws SQLException {
		
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		pstmt = conn.prepareStatement("insert into userOrder(oId, oDate, mId, pId, quantity, price, statusCode) "
				+ "select OID_SEQ.nextval, sysdate, ?, a.pId, a.cquantity, b.price * a.cquantity, 1 "
				+ "from userCart a, product b "
				+ "where a.pId = b.pId");
		try {
			pstmt.setString(1, mId);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}

}