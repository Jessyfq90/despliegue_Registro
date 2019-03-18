<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.ServletException" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PC</title>
		<link href="./css/estilos.css" type="text/css" rel="stylesheet"/>
		<link href="./css/tabla.css" type="text/css" rel="stylesheet"/>
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
			<h1>PC</h1>
		</header>
		<nav>
			<ul class="menu1">
				<li><a href="paginaPrincipal.jsp">Inicio</a></li>
				<li><a href="ps.jsp">Playstation 4</a></li>
				<li><a href="switch.jsp">Nintendo Switch</a></li>
				<li><a href="nintendods.jsp">Nintendo 2DS/3DS</a></li>
				<li><a href="xbox.jsp">X-Box ONE</a></li>
				<li><a href="pc.jsp">PC</a></li>
			</ul>
			<ul class="menu2">
				<li><a href="logout">Cerrar sesión</a></li>
			</ul>
		</nav>
		<main>
			<h2>Bienvenido a la sección PC, <%=user %></h2>
			<table>
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Precio</th>
					<th>Descripcion</th>
					<th>Año</th>
				</tr>
			</thead>
			<tbody>
			<!-- Acceso a la base de datos para mostrar en una lista los juegos que hay para la play4: -->
				<%
					Connection conexion=null;
					Statement st;
					ResultSet rs=null;
					String sentencia;
					
					
					try{
						conexion=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
						st=conexion.createStatement();
						sentencia="select * from juegos j, modelo m where m.tipo = 'PC' and m.id=j.id_modelo";
						rs=st.executeQuery(sentencia);
						while(rs.next()){
							//String tipo=rs.getString("tipo");
							String nombre=rs.getString("nombre");
							float precio=rs.getFloat("precio");
							String descripcion=rs.getString("descripcion");
							int year=rs.getInt("year");
							boolean disponible=rs.getBoolean("disponible");
							//si esta disponible pongo tr y si no esta disponible le pongo la class rojo para cambiarle el color
							if(disponible){
				%>
					<tr>
					<%		}else{ %>
					<tr class="rojo">
					<%		} %>
						<td><%=nombre %></td>
						<td><%=precio %>€</td>
						<td class="descripcion"><%=descripcion %></td>
						<td><%=year %></td>
					</tr>
					
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
				</tbody>
			</table>
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