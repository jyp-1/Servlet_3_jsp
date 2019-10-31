<%@page import="com.jy.notice.NoticeDTO"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnetor.getConnection();
	NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
	
	
	String message="OK";
	if(noticeDTO==null){
	message="해당하는 글이 없습니다.";
	}
	
	
	if(noticeDTO==null){
		request.setAttribute("msg", message);
		request.setAttribute("path", "./noticeList.jsp" );
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
		
				
	}else{
		request.setAttribute("DTO", noticeDTO);
		RequestDispatcher view = request.getRequestDispatcher("./noticeSelectResult.jsp");
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

</body>
</html>