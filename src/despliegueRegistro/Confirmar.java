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
	String user;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//el hash
		String id=req.getParameter("id");
	
		
		//Comprobar si el hash existe en la base de datos 
		
		boolean valido=comprobarHash(id);
		if(valido) {
			
			borrarHash(id);
			//redireccionamos a pagina principal despues de abrir la sesion con el atribute logueado y el nombre del user
			
			HttpSession sesion=req.getSession();
			sesion.setAttribute("logueado", user);
			resp.sendRedirect("paginaPrincipal.jsp");
		}else {
			throw new ServletException("Error en la confirmación");
		}
		

	
	}
	/**
	 * Borramos el hash en la base de datos
	 * @param id es el hash
	 * @throws ServletException
	 */
	private void borrarHash(String id) throws ServletException {
		// TODO Auto-generated method stub
		Connection con=null;
		
		try {
			con=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
			Statement st=con.createStatement();
			String sentencia="update usuarios set hash='' where hash='"+id+"'";
			int rs=st.executeUpdate(sentencia);
		} catch (SQLException e) {
			throw new ServletException(e);
		}
		
	}
	/**
	 * Comprobamos si existe el hash en la base de datos, si existe cogemos el valor user de esa fila 
	 * y devolvemos true
	 * @param id es el hash
	 * @return
	 * @throws ServletException
	 */
	private boolean comprobarHash(String id) throws ServletException{
		// TODO Auto-generated method stub
		Connection con=null;
		ResultSet rs=null;
		boolean coinciden=false;
		try {
			//encryptar la password
			con=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
			Statement st= con.createStatement();
			String sentencia="select * from usuarios where hash='"+id+"'";
			rs=st.executeQuery(sentencia);
			while(rs.next()) {
				//con el coinciden=true deberia funcionar sin mas
				String hashRegistrado=rs.getString("hash");
				if(hashRegistrado.equals(id)) {
					//hash coinciden
					user=rs.getString("user");
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
