package model.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.dao.MemberDAO;
import model.dto.MemberDTO;


// 커밋 테스트 뭐가 이리 불편하노
public class MemberService {
	
	private static MemberService instance = new MemberService();

	public static MemberService getInstance() {
		return instance;
	}

	private MemberService() {
	}
	
	public MemberDTO submitLogin(String id, String pw) {
		
        Connection conn = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();
            
            return memberDAO.submitLogin(conn, id, pw);
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
    }

	public void submitSignUp(MemberDTO member) {
		
		Connection conn = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();            
            
            memberDAO.submitSignUp(conn, member);
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
     
	}

	public boolean checkUniqueId(String inputedId) {
		
		Connection conn = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();            
            
            return memberDAO.checkUniqueId(conn, inputedId);
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        
		return false;
	}
	
	public boolean checkUniqueEmail(String inputedEmail) {

        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();            

            return memberDAO.checkUniqueEmail(conn, inputedEmail);

        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return false;
    }
	
	public MemberDTO checkEmail(String mId) {		
		
		Connection conn = null;

		try {
			
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();
            
            return memberDAO.checkEmail(conn, mId);
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        return null;
	}
	
	public void changePwd(String mId, String pw) {
		Connection conn = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();   
            conn.setAutoCommit(false);
            
            memberDAO.changePwd(conn, mId, pw);
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
	}
	
	public void deleteAccount(String mId) {
		Connection conn = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();   
            conn.setAutoCommit(false);
            
            memberDAO.deleteAccount(conn, mId);
            conn.commit();
            
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
	}

}

