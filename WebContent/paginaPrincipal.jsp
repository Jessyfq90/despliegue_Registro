<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Página principal</title>
	</head>
	<body>
		<%
			HttpSession sesion=request.getSession();
			String user=(String)sesion.getAttribute("logueado");
			if(user==null){
				response.sendRedirect("index.html");
			}else{
			
		%>
		<h1>Página principal</h1>
		<h2>Bienvenido <%=user %></h2>
		<button href="logout">Cerrar sesión</button>
		<%} %>
	</body>
</html>