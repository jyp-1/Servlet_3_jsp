<%@page import="com.jy.member.MemberDAO"%>
<%@page import="com.jy.member.MemberDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO = new MemberDTO();
	
	
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	memberDTO.setGrade(Integer.parseInt(request.getParameter("grade")));
	
	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnetor.getConnection();	
			
	int result = memberDAO.memberInsert(con,memberDTO);
	
	con.close();
 
	





%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>