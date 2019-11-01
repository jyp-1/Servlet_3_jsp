<%@page import="com.jy.member.MemberDTO"%>
<%@page import="com.jy.point.PointDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jy.notice.NoticeDTO"%>
<%@page import="com.jy.notice.NoticeDAO"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnetor.getConnection();
	ArrayList<NoticeDTO> ar = noticeDAO.noticeList(con);
	
	con.close();
	
	//쿠키발행 
	//쿠키 생성시 생성자에 키와 밸류 입력 
	Cookie cookie = new Cookie("name","iu");
	
	//쿠키가 적용되는 path 설정: 보통 context path 적용 
	cookie.setPath(request.getContextPath());
	//쿠키의 유효시간 
	//단위 초단위
	//설정을 하지 않으면 웹브라우저가 종료되면 같이 종료 됨
	cookie.setMaxAge(60*60);
	
	//쿠키를 클라이언트로 전송 
	response.addCookie(cookie);

	
	
%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<style type="text/css">

body{
	background-color: GhostWhite;}


.t1{ 
	width: 100%;
	border: 1px black hidden;
	border-spacing: 0px;
	border-collapse: collapse;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	
	
	}
	td{
	height:40px;
	color: black;	
	border-bottom: 5px GhostWhite solid; 
	background-color: white;			
	}
	
.n1{
	text-align:center; 
	font-weight: bold;
	}

.t2{
	width: 10%;
	text-align: center;
	}
	
.t3{
	background-color: black;
	color: white;
	font-weight: bold;
}
.t4{
	text-align: left;
}

.a1{
	color: black;
	text-decoration: none;

}
.c1{
	border-style: none;
}
#nsa{
	color:black;
	text-decoration: none;
	font-weight: bold;
}

</style>


</head>
<body>

		
	<%@ include file="../layout/nav.jsp" %>	
   
  <div class="container">  
  <h1 class="n1">Notice List</h1>        
  <table class="t1">
    <thead>
      <tr>
        <td class="t2 t3">NUM</td>
        <td class="t2 t3">Title</td>
        <td class="t2 t3">Writer</td>
        <td class="t2 t3">Date</td>
        <td class="t2 t3">Hit</td>
      </tr>
    </thead>
    <tbody>
    	<%for(int i=0;i<ar.size();i++){
    		NoticeDTO noticeDTO = ar.get(i);
    		%>
      <tr>
        <td><%=noticeDTO.getNum() %></td>
        <td ><a id="nsa"href="./noticeSelect.jsp?num=<%=noticeDTO.getNum()%>"><%=noticeDTO.getTitle() %></a></td>
        <td><%=noticeDTO.getWriter() %></td>
        <td><%=noticeDTO.getReg_date() %></td>
        <td><%=noticeDTO.getHit() %></td>
      </tr>
    	<%}%>
    </tbody>
  </table>
  <br>
  
  <%if(memberDTO !=null && memberDTO.getGrade()==0){ %>
  <a href="./noticeWrite.jsp" class="btn btn-default">Write</a>
  <%}else{ %>
  <%} %>
</div>





</body>
</html>