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
	int result= pointDAO.delete(con, num);
	
	con.close();
	
	String message="삭제 실패";
	
	if(num>0){
		message="삭제 성공";
	}
	
	//성공하면 성공메세지 alert List로 
	//실패하면 list로 바로 이동
	
	if(result==0){
		response.sendRedirect("./pointList.jsp");
	}else{
	request.setAttribute("msg", message);
	request.setAttribute("path", "./pointList.jsp" );
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
	
	}
	
	
	
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
			
</script>

</body>
</html>