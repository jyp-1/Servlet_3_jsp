<%@page import="com.jy.point.PointDTO"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	int num = Integer.parseInt(request.getParameter("num"));
    	
    	PointDAO pointDAO = new PointDAO();
    	Connection con = DBConnetor.getConnection();
    	PointDTO pointDTO=pointDAO.selectOne(con, num);
    	
    	con.close();
    	
 
		
    
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
			
			<div class="container">
  <h2>Point Update Page</h2>
  		<form action="./pointUpdateResult.jsp" method="post">
  				<input type="hidden" name="num" value="<%=pointDTO.getNum() %>">
  			

    		<div class="form-group">
      			<label for="name">Name:</label>
      			<input type="text" class="form-control" value="<%=pointDTO.getName() %>" id="name" placeholder="Enter name" name="name">
    		</div>
    		
    		<div class="kor">
      			<label for="kor">Kor:</label>
      			<input type="text" class="form-control" value="<%=pointDTO.getKor() %>" id="kor" placeholder="Enter kor" name="kor">
    		</div>
    		
    		<div class="eng">
      			<label for="eng">Eng:</label>
      			<input type="text" class="form-control" value="<%=pointDTO.getEng() %>" id="eng" placeholder="Enter eng" name="eng">
    		</div>
    		
    		<div class="math">
      			<label for="math">Math:</label>
      			<input type="text" class="form-control" value="<%=pointDTO.getMath() %>" id="math" placeholder="Enter math" name="math">
    		</div>
    		
    			<button type="submit" class="btn btn-default">Submit</button>
  			</form>
				</div>
			
			
			
</body>
</html>