<%@page import="com.jy.point.PointDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="com.jy.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
     request.setCharacterEncoding("UTF-8");
     response.setCharacterEncoding("UTF-8");
     int num = Integer.parseInt(request.getParameter("num"));
     
     PointDAO pointDAO = new PointDAO();
     Connection con =DBConnetor.getConnection();
     PointDTO pointDTO= pointDAO.selectOne(con, num);
    
     if(pointDTO == null){
     response.sendRedirect("./pointList.jsp");
     }else{
    	 
    	 request.setAttribute("DTO", pointDTO);
    	 RequestDispatcher view =request.getRequestDispatcher("./pointSelectResult.jsp");
    	 view.forward(request, response);
     };
     
    %>
    
    
