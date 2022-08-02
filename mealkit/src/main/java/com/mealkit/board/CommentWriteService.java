package com.mealkit.board;

import java.sql.Connection;
import java.util.Date;

import com.mealkit.board.CommentDaoOld;
import com.mealkit.board.CommentVO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class CommentWriteService {

	private CommentDaoOld commentDao = new CommentDaoOld();

	public Integer submit(CommentVO commentDTO,int pId) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			CommentVO cCommentDTO= toPage(commentDTO);
			//CommentSubmitPage cexecution = commentDao.insert(conn, member);
			
			
			if(cCommentDTO == null) {
				throw new RuntimeException("fail to insert");
			}
			
			CommentVO savedContent = commentDao.insert(conn, cCommentDTO,pId);
			if(savedContent == null) {
				throw new RuntimeException("fail to insert");
			}
			conn.commit();
			
			return 0;//reviewValue
		}catch(Exception e){
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return 1;

	}
	
	private CommentVO toPage(CommentVO commentDTO) {
		Date nowDate = new Date();
		return new CommentVO(commentDTO.getmId(),commentDTO.getContent(),nowDate);
	}
}
