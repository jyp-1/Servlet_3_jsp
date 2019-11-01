<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.member.MemberDAO"%>
<%@page import="com.jy.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
         
     MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
    MemberDAO memberDAO = new MemberDAO();
    Connection con = DBConnetor.getConnection();
    		
    int result = memberDAO.memberDelete(con, memberDTO);
    
    con.close();
    
    session.invalidate();
    
    response.sendRedirect("../index.jsp");
    		
     
     
     
     
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