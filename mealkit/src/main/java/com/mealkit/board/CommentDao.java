package com.mealkit.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mealkit.member.MemberPage;
import com.mealkit.board.CommentDTO;
import jdbc.JdbcUtil;

public class CommentDao {

	public CommentDTO insert(Connection conn, CommentDTO commentDTO, int pId) {

		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//rNo가 notnull이므로 값이없을시 에러- db sequence가있어 값은 정상적용됨 
			pstmt = conn.prepareStatement("insert into review (rNo,mId,pId,content,regdate) values (1,?,?,?,?)");
//			pstmt.setInt(1,(int)commentDTO.getrNo());
			pstmt.setString(1, commentDTO.getmId());
			pstmt.setInt(2, pId);
			pstmt.setString(3, commentDTO.getContent());
			pstmt.setDate(4, new java.sql.Date(commentDTO.getRegDate().getTime()));
			
			int insertedCount = pstmt.executeUpdate();//필수
			
			if(insertedCount > 0) {
				stmt = conn.createStatement();
				//rs = stmt.executeQuery("select ")
				//table에 시퀀스도입하여야 구현가능
			}
			
			return new CommentDTO(commentDTO.getmId(),commentDTO.getContent(),commentDTO.getRegDate());
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
		return null;

	}
	
	//수정필요
	public List<CommentDTO> select(Connection conn,int pId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from review where pId = ? order by regDate desc");
			/*
			 * pstmt.setInt(1,startRow); pstmt.setInt(2, size);
			 */
			pstmt.setInt(1, pId);
			
			rs = pstmt.executeQuery();
			List<CommentDTO> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertCDTO(rs));
			}
			return result;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	
	private CommentDTO convertAs(ResultSet rs)throws SQLException{
		return new CommentDTO(rs.getInt("rNo"),rs.getString("mId"),rs.getString("content"),rs.getDate("regDate"));
		
	}
	
	public CommentDTO selectById(Connection conn , int rNo)throws SQLException{
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from review where rNo = ?");
			pstmt.setInt(1, rNo);
			rs = pstmt.executeQuery();
			CommentDTO commentdto = null;
			if(rs.next()) {
				commentdto = convertAs(rs);
			}
			return commentdto; 
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	
	private CommentDTO convertCDTO(ResultSet rs)throws SQLException {
		
		return new CommentDTO((Number)rs.getInt("rNo"),rs.getString("mId"),rs.getString("content"),rs.getDate("regDate"));

//		return new CommentDTO((Number)rs.getInt("rNo"),rs.getString("mId"),rs.getString("content"),rs.getTimestamp("regDate"));
		
		//받아오는 data목록
		
	}
	
	/*
	 * public CommentSubmitPage insert(Connection conn , CommentSubmitPage
	 * commentSubmitpage) throws SQLException{ PreparedStatement pstmt = null;
	 * 
	 * try { pstmt =
	 * conn.prepareStatement("insert into review (mId,reviews) values(?,?)");
	 * pstmt.setString(1, commentSubmitpage.getMember().getmId());
	 * pstmt.setString(2, commentSubmitpage.getReviews());
	 * 
	 * pstmt.executeUpdate();
	 * 
	 * conn.commit(); } finally { JdbcUtil.close(pstmt); } return null;
	 * 
	 * }
	 */

}