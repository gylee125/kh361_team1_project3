package model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import Member.MemberPage;
import model.dao.CommentDao;
import model.dto.CommentDTO;
import jdbc.connection.ConnectionProvider;

public class CommentListService {

	private CommentDao commentDao = new CommentDao();
	
	public ReviewPage getReviewPage(int pId) {
		try(Connection conn = ConnectionProvider.getConnection()){
			
			System.out.println("commentListService-handlercalled pid is:"+pId);
			
			List<CommentDTO> commentdto = commentDao.select(conn,pId);
			//List<MemberPage> member = commentDao.select(conn);
			return new ReviewPage(commentdto);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public CommentDTO getCommentDTO(int reviewNum) {
		try (Connection conn = ConnectionProvider.getConnection()){
			CommentDTO commentdto = commentDao.selectById(conn, reviewNum);
			if(commentdto == null) {
				throw new SQLException();
			}
			
			if(commentdto.getContent() == null) {
				throw new SQLException("contentnull");
			}
		
		return commentdto;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
		
	}
}
