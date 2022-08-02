package com.mealkit.board;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.mealkit.member.MemberPage;
import com.mealkit.board.CommentDaoOld;
import com.mealkit.board.CommentVO;
import jdbc.connection.ConnectionProvider;

public class CommentListService {

	private CommentDaoOld commentDao = new CommentDaoOld();
	
	public ReviewPage getReviewPage(int pId) {
		try(Connection conn = ConnectionProvider.getConnection()){
			
			System.out.println("commentListService-handlercalled pid is:"+pId);
			
			List<CommentVO> commentdto = commentDao.select(conn,pId);
			//List<MemberPage> member = commentDao.select(conn);
			return new ReviewPage(commentdto);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public CommentVO getCommentDTO(int reviewNum) {
		try (Connection conn = ConnectionProvider.getConnection()){
			CommentVO commentdto = commentDao.selectById(conn, reviewNum);
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
