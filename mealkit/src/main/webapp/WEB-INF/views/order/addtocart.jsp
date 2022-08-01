<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ include file="../include/header.jspf" %>

<%
	String menu = request.getParameter("m_menu");
	ArrayList<String> list = (ArrayList)session.getAttribute("list");
	if(list==null)
	{
		list = new ArrayList<String>();
	}
	list.add(menu);
	
	session.setAttribute("list",list);
%>

<script type="text/javascript">
 alert("장바구니에 추가되었습니다.");
 history.go(-1);
</script>

<%@ include file="../include/footer.jspf" %>