<%@page import="com.jy.member.MemberDAO"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	MemberDTO memberDTO = new MemberDTO();
	MemberDAO memberDAO = new MemberDAO();
	
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	
	MemberDTO seesionDto = (MemberDTO)session.getAttribute("member");
	memberDTO.setGrade(seesionDto.getGrade());
	
	
	Connection con = DBConnetor.getConnection();
	
	int result = memberDAO.memberUpdate(con, memberDTO);
	
	
	
	String message ="Update Fail";
	if(result>0){
		message = "Update Success";
		session.setAttribute("member", memberDTO);
	}
		request.setAttribute("msg", message);
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response); 
	
	
	
    
    
    
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