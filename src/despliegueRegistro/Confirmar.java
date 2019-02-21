package despliegueRegistro;

import java.io.IOException;
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
@WebServlet("/confirmar")
public class Confirmar extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		HttpSession sesion=req.getSession();
		String user=(String) sesion.getAttribute("user");
		

		//LLEgan bien los dos datos
		//pw.println("El hash: "+id);
		//pw.println("El usuario: "+user);
		//Comprobar si el hash del user en la base de datos es igual al hash que llega
		
		boolean valido=comprobarHash(id,user);
		if(valido) {
			
			borrarHash(user);
			//redireccionamos a pagina principal despues de abrir la sesion con el atribute logueado y el nombre del user
			sesion.setAttribute("logueado", user);
			resp.sendRedirect("paginaPrincipal.jsp");
		}else {
			throw new ServletException("Error en la confirmación");
		}
		

	
	}
	private void borrarHash(String user) throws ServletException {
		// TODO Auto-generated method stub
		Connection con=null;
		
		try {
			con=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
			Statement st=con.createStatement();
			String sentencia="update usuarios set hash='' where user='"+user+"'";
			int rs=st.executeUpdate(sentencia);
		} catch (SQLException e) {
			throw new ServletException(e);
		}
		
	}
	private boolean comprobarHash(String id, String user) throws ServletException{
		// TODO Auto-generated method stub
		Connection con=null;
		ResultSet rs=null;
		boolean coinciden=false;
		try {
			//encryptar la password
			con=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
			Statement st= con.createStatement();
			String sentencia="select * from usuarios where user='"+user+"'";
			rs=st.executeQuery(sentencia);
			while(rs.next()) {
				String hashRegistrado=rs.getString("hash");
				if(hashRegistrado.equals(id)) {
					//hash coinciden
					coinciden=true;
				}
			}
			
		}catch(SQLException e) {
			throw new ServletException(e);
		}finally {
			
				try {
					if(rs!=null) {
						rs.close();
					}
				} catch (SQLException e) {
					throw new ServletException(e);
				}
			
		}
		return coinciden;
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	String id=req.getParameter("id");
		throw new ServletException("no ha llegado a la página a través del formulario");
		
	}
}
