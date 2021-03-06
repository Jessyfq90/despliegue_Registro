<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.ServletException" %>
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
			<h1>Bienvenido a Despliegue de Aplicaciones Web</h1>
		</header>
		<nav>
			<ul class="menu1">
				<li><a href="paginaPrincipal.jsp">Inicio</a></li>
				<li><a href="ps.jsp">Playstation 4</a>
<!-- 					<ul class="submenu"> -->
<!-- 						<li>Quiénes somos</li> -->
<!-- 						<li>Donde estamos</li> -->
<!-- 					</ul> -->
				</li>
				<li><a>Nintendo Switch</a></li>
				<li><a href="nintendods.jsp">Nintendo 2DS/3DS</a></li>
				<li><a>X-Box ONE</a></li>
				<li><a>PC</a></li>
			</ul>
			<ul class="menu2">
				<li><a href="logout">Cerrar sesión</a></li>
			</ul>
		</nav>
		<main>
			<h2>Inicio</h2>
			<h2>Bienvenido <%=user %></h2>
			<p>En esta página web podrá informarse sobre multitud de juegos para diferentes plataformas: </p>
			<ul>
				<!-- Acceso a la base de datos para mostrar en una lista los modelos que hay: -->
				<%
					Connection conexion=null;
					Statement st;
					ResultSet rs=null;
					String sentencia;
					
					
					try{
						conexion=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
						st=conexion.createStatement();
						sentencia="select * from modelo";
						rs=st.executeQuery(sentencia);
						while(rs.next()){
							String tipo=rs.getString("tipo");
				%>
					<li><%=tipo %></li>
				<% 
							
						}
					}catch (SQLException e) {
						throw new ServletException(e);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						throw new ServletException(e);
					}finally {
						
							try {
								if(rs!=null)
									rs.close();
							} catch (SQLException e) {
								throw new ServletException(e);
							}
					}
				
				%>
			</ul>
		<p>Existen juegos disponibles para diferentes plataformas.</p>
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
		
		<%} //Cierre del if(usuario==null)else %>
	</body>
</html>