<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Página principal</title>
		<link href="./css/estilos.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<%
			HttpSession sesion=request.getSession();
			String user=(String)sesion.getAttribute("logueado");
			if(user==null){
				response.sendRedirect("index.html");
			}else{
			
		%>
		<header>
			<h1>Página principal</h1>
		</header>
		<main>
			<h2>Bienvenido <%=user %></h2>
			<a href="logout">Cerrar sesión</a>
		<%} %>
		</main>
		<footer>
			<section class="contacto">
				<p>I.E.S. Doctor Fleming</p>
				<p>Oviedo, Asturias</p>
				<p>Tel. 985 23 08 99</p>
			</section>
			<span class="divisor"></span>
			<section class="redes">
				<p>Páginas de interés</p>
				<ul>
					<li><a href="http://nntt.informatica-fleming.com/coordina/">Página oficial</a></li>
					<li><a href="https://es-es.facebook.com/pages/category/High-School/IES-Doctor-Fleming-1019283734766885/">Facebook</a></li>
					
				</ul>
			</section>
			<span class="divisor"></span>
			<section class="ayuda">
				<p><a href="#">Ayuda</a></p>
				<p><a href="#">Mapa Web</a><p>
			</section>
		</footer>
	</body>
</html>