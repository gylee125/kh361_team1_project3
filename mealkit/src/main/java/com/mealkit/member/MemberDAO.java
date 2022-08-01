package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.dto.MemberDTO;

public class MemberDAO {
	
private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	private MemberDAO() {}
	
	private MemberDTO makeMemberFromResultSet(ResultSet rs) throws SQLException {
		
	    MemberDTO memberDTO = new MemberDTO();
        
	    memberDTO.setmNo(rs.getInt("mNo"));
	    memberDTO.setmId(rs.getString("mId"));
	    memberDTO.setPw(rs.getString("pw"));
	    memberDTO.setmName(rs.getString("mName"));
	    memberDTO.setPhone(rs.getString("phone"));
	    memberDTO.setAddress(rs.getString("address"));
	    memberDTO.setEmail(rs.getString("email"));
	    memberDTO.setRegDate(rs.getDate("regDate"));
	    memberDTO.setmLevel(rs.getInt("mLevel"));	   
        
        return memberDTO;
    }

    public MemberDTO submitLogin(Connection conn, String id, String pw) throws SQLException {
        
        ResultSet resultSet;
        PreparedStatement pstmt = null;      
        
        pstmt = conn.prepareStatement("select * from member where mId=? and pw=?");
        
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        
        resultSet = pstmt.executeQuery();      
        
        if (resultSet.next())
            return makeMemberFromResultSet(resultSet);             
        else
        	return null;
    }

	public void submitSignUp(Connection conn, MemberDTO member) throws SQLException {
	
        PreparedStatement pstmt = null;      
        
        pstmt = conn.prepareStatement("insert into member"
        		+ "(mNo, mId, pw, mName, phone, address, email, regDate)"
        		+ " values(mNo_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)");
        
        pstmt.setString(1, member.getmId());
        pstmt.setString(2, member.getPw());
        pstmt.setString(3, member.getmName());
        pstmt.setString(4, member.getPhone());
        pstmt.setString(5, member.getAddress());
        pstmt.setString(6, member.getEmail());
        
        pstmt.executeUpdate();                   
	}

	public boolean checkUniqueId(Connection conn, String inputedId) throws SQLException {
		
		ResultSet resultSet;
		PreparedStatement pstmt = null; 
		
        pstmt = conn.prepareStatement("select * from member where mId=?");        
        pstmt.setString(1, inputedId);                
        resultSet = pstmt.executeQuery();      
        
        if (resultSet.next())
            return false;      
        else
        	return true;
	}

    public boolean checkUniqueEmail(Connection conn, String inputedEmail) throws SQLException {
        ResultSet resultSet;
        PreparedStatement pstmt = null; 

        pstmt = conn.prepareStatement("select * from member where email=?");        
        pstmt.setString(1, inputedEmail);                
        resultSet = pstmt.executeQuery();      

        if (resultSet.next())
            return false;      
        else
            return true;
    }
    
	public MemberDTO checkEmail(Connection conn, String mId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet resultSet;
		
		pstmt = conn.prepareStatement("select * from member where mId=?");        
        pstmt.setString(1, mId);
        
        resultSet = pstmt.executeQuery();
        
        if (resultSet.next())
            return makeMemberFromResultSet(resultSet);             
        else
        	return null;
	}
	
	public void changePwd(Connection conn, String mId, String pw) throws SQLException {
		
		PreparedStatement pstmt = null;
		
		pstmt = conn.prepareStatement("update member set pw=? where mId=?");        
        pstmt.setString(1, pw);
        pstmt.setString(2, mId);
        
        pstmt.executeUpdate();
        conn.commit(); 
	}
	
	public void deleteAccount(Connection conn, String mId) throws SQLException {
		
		PreparedStatement pstmt = null;
		
		pstmt = conn.prepareStatement("delete from member where mId=?");
        pstmt.setString(1, mId);
        
        pstmt.executeUpdate();
        conn.commit();
	}
}
