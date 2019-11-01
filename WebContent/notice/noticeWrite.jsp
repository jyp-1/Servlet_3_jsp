<%@page import="com.jy.member.MemberDTO"%>
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
		<%
			if(memberDTO ==null || memberDTO.getGrade() !=0){
				request.setAttribute("msg", "안댐");
				request.setAttribute("path", "../index.jsp");
				RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
				view.forward(request, response);
			}
		%>
			<div class="container">
  <h2>Notice Write Page</h2>
  		<form action="./NoticeWriteResult.jsp" method="post">
  		
    		<div class="form-group">
      			<label for="title">title:</label>
      			<input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
    		</div><br>
    		
    		<div class="writer">
      			<label for="writer">writer:</label>
      			<input type="text" class="form-control" value="<%=memberDTO.getId() %>" readonly="readonly" id="writer" placeholder="Enter writer" name="writer">
    		</div><br>
    		
    		<div class="contents">
      			<label for="contents">contents:</label>
      			<textarea class="form-control" id="contents" placeholder="Enter contents" name="contents"></textarea>
    		</div><br>
    		
    		
    			<button type="submit" class="btn btn-default">Submit</button>
    			<a href="./noticeList.jsp" class="btn btn-info">Go list</a>
  			</form>
				</div>





</body>
</html>