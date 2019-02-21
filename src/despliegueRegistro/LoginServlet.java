package despliegueRegistro;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw=resp.getWriter();
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
			try {
				conexion=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
				st=conexion.createStatement();
				sentencia="select * from usuarios where user='"+user+"'";
				rs=st.executeQuery(sentencia);
				
				byte[] cifrada=cifrarClave(clave);
				while(rs.next()) {
					String contra=rs.getString("password");
					if(contra.equals(cifrada)) {
						String hash=rs.getString("hash");
						if(hash.isEmpty()) {
							//abrir sesion
							HttpSession sesion=req.getSession();
							sesion.setAttribute("logueado", user);
							//redirecciono a pagina principal
							resp.sendRedirect("paginaPrincipal.jsp");
						}else {
							//que me mande a informacionDeRegistro
							req.setAttribute("id", hash);
							//para pasar el usuario
							req.setAttribute("usuario",user);
							req.getRequestDispatcher("/informacionDeRegistro.jsp").forward(req, resp);//pasamos req y resp que recibio la página
						}
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
	
	private byte[] cifrarClave(String clave) throws Exception{
		final byte[] bytes = clave.getBytes("UTF-8");
		final Cipher aes = obtieneCipher(true);
		final byte[] cifrado = aes.doFinal(bytes);
		return cifrado;
	}

	private Cipher obtieneCipher(boolean paraCifrar) throws Exception{
		// TODO Auto-generated method stub
		final String frase = "FraseLargaConDiferentesLetrasNumerosYCaracteresEspeciales_áÁéÉíÍóÓúÚüÜñÑ1234567890!#%$&()=%_NO_USAR_ESTA_FRASE!_";
		final MessageDigest digest = MessageDigest.getInstance("SHA");
		digest.update(frase.getBytes("UTF-8"));
		final SecretKeySpec key = new SecretKeySpec(digest.digest(), 0, 16, "AES");

		final Cipher aes = Cipher.getInstance("AES/ECB/PKCS5Padding");
		if (paraCifrar) {
			aes.init(Cipher.ENCRYPT_MODE, key);
		} else {
			aes.init(Cipher.DECRYPT_MODE, key);
		}

	return aes;
	}
}
