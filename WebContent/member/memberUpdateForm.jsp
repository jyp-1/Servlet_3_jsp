<%@page import="com.jy.member.MemberDTO"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%

    
    %>
    
    
    
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
			<div class="container">
 		 <h2>Member Update Form Page</h2>
  		<form action="./memberUpdateResult.jsp" method="post">
  		
  			<div class="form-group">
      			<label for="id">ID:</label>
      			<input type="text" class="form-control" readonly="readonly" value= "<%=memberDTO.getId() %>" id="id" placeholder="Enter id" name="id">
    		</div><br>
  		
    		<div class="form-group">
      			<label for="pw">PW:</label>
      			<input type="text" class="form-control" id="pw" value= "<%=memberDTO.getPw() %>" placeholder="Enter PW" name="pw">
    		</div><br>
       		
    		<div class="phone">
      			<label for="phone">Phone:</label>
      			<input type="text" class="form-control" id="phone" value= "<%=memberDTO.getPhone() %>" placeholder="Enter phone" name="phone">
    		</div><br>
    		
    		
    			<button type="submit" class="btn btn-default">Submit</button>
    			<a href="./memberMypage.jsp" class="btn btn-info">Go list</a>
  			</form>
				</div>
			
			
			
			
</body>
</html>