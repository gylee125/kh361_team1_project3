package com.mealkit.member;

// 쿼리문 빼서 매퍼.xml 파일 만들기
// dao는 연동만 하는 걸로 수정

public class MemberDAO {
	
private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	private MemberDAO() {}


}
