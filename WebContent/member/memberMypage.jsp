<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
		
		<%@ include file="../layout/nav.jsp" %>	
		
		<%if(memberDTO ==null){
			request.setAttribute("msg", "권한 없음");
			request.setAttribute("path", "../index.jsp");
			RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
			view.forward(request, response);
		} %>
		
			
<h1> ID: <%= memberDTO.getId() %></h1>
<h1> Name :<%= memberDTO.getName() %> </h1>
<h1> Phone :<%= memberDTO.getPhone() %> </h1>
<h1> E-mail :<%= memberDTO.getEmail() %> </h1>
<h1> Grade :<%= memberDTO.getGrade() %> </h1>
<a href="./memberUpdateForm.jsp" class="btn btn-info">수정</a>
<a href="./memberDelete.jsp" class="btn btn-info">탈퇴</a>

</body>
</html>