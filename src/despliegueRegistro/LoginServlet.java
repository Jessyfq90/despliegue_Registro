package despliegueRegistro;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	PrintWriter pw;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		pw=resp.getWriter();
		Connection conexion=null;
		Statement st;
		ResultSet rs=null;
		String sentencia;
		
		String user=req.getParameter("user");
		String clave=req.getParameter("clave");
		
		//encriptar la clave igual que al registrarla
		if(user.isEmpty() || clave.isEmpty()) {
			throw new ServletException("No has introducido usuario o contraseña");
		}else {
			//registres juana  contra:1234
			//registre luis 23456
		
			try {
				conexion=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
				st=conexion.createStatement();
				sentencia="select * from usuarios where user='"+user+"'";
				rs=st.executeQuery(sentencia);
				pw.println("antes de cifrar");
				String encriptada=cifra(clave);//cifro la que me llega del formulario
				while(rs.next()) {
					//Comprobar que funciona esto.
					pw.println("entra en el while");
					String contra=rs.getString("password");//la que leo de la base de datos
					if(contra.equals(encriptada)) {	
						pw.println("entra en el if");
						String hash=rs.getString("hash");
						if(hash.isEmpty()) {
							//abrir sesion
							HttpSession sesion=req.getSession();
							sesion.setAttribute("logueado", user);
							//redirecciono a pagina principal
							resp.sendRedirect("paginaPrincipal.jsp");
						}else {
							pw.println("entra en el else");
							//que me mande a informacionDeRegistro
							req.setAttribute("id", hash);
							//para pasar el usuario
							req.setAttribute("usuario",user);
							req.getRequestDispatcher("/informacionDeRegistro.jsp").forward(req, resp);//pasamos req y resp que recibio la página
						}
					}else {
						throw new ServletException("Datos de login incorrectos");
					}
				}
			} catch (SQLException e) {
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
			
			
		}
		
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		throw new ServletException("No has iniciado sesión");
	}
	
	private String cifra(String pal) throws NoSuchAlgorithmException {
		MessageDigest md=MessageDigest.getInstance("SHA-512");//PARA ENCRIPTAR Y CREAR HASH
		byte a[]=md.digest(pal.getBytes());
		String cifrada= DatatypeConverter.printHexBinary(a);
		return cifrada;
	}


}
