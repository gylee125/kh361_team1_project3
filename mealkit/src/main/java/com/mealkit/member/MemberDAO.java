package com.mealkit.member;

<<<<<<< HEAD
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mealkit.member.MemberDTO;
=======
// 쿼리문 빼서 매퍼.xml 파일 만들기
// dao는 연동만 하는 걸로 수정
>>>>>>> branch 'csw_board_review' of https://github.com/gylee125/kh361_team1_project3.git

public class MemberDAO {
	
private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	private MemberDAO() {}


}