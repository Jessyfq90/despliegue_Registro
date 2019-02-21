<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Información de registro</title>
	</head>
	<body>
	
	<%
		String hash=(String) request.getAttribute("id");
		String usuario=(String)request.getAttribute("usuario");
		HttpSession sesion=request.getSession();
		sesion.setAttribute("user", usuario);
	%>
		<h1>Tramitando registro</h1>
		<p>Consulte su correo electrónico</p>
		<p>Se le ha enviado un e-mail para confirmar su contraseña</p>
		<p><a href="http://localhost:8080/despliegueRegistro/confirmar?id=<%=hash %>">Confirmar</a></p>
	</body>
</html>