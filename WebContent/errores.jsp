<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>¡Errores!</title>
		<link href="./css/estilos.css" type="text/css" rel="stylesheet"/>
	</head>
	<body>
		<header id="error">
			<h1 >Ha sucedido un error!</h1>
		</header>
		<%
			String msg=(String) request.getAttribute("javax.servlet.error.message");
		%>
		<main>
			<section class="errores">
				<p><%=msg %></p>
				<p>Vuelve a la página de <a href="index.html"> inicio de sesión.</a></p>
			</section>
		</main>
	</body>
</html>