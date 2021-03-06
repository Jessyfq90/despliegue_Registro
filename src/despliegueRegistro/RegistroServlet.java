package despliegueRegistro;

import java.io.IOException;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;





@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {
	//Como mandar un email de confirmación
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("usuario").isEmpty() || req.getParameter("password").isEmpty())
			throw new ServletException("Te ha faltado datos por introducir");
		Properties propiedades=new Properties();
		propiedades.put("mail.transport.protocol","smtp");
		Session mailSession=Session.getInstance(propiedades);
		Message msg=new MimeMessage(mailSession);
		
		try {
			//direccion de correo desde la que mando el mensaje
			msg.setFrom(new InternetAddress("fpdespliegue8@gmail.com"));
			//direccion de correo a la que mando el mensaje, es la que me llega del formulario de registro
			msg.setRecipient(Message.RecipientType.TO , new InternetAddress(req.getParameter("email")) );
			//la fecha
			msg.setSentDate(new Date());
			//El asunto
			msg.setSubject("Configuración de registro en infojuegos.com");
			//creamos el string que sera el cuerpo del mensaje a enviar
			StringBuilder sb=new StringBuilder();
			sb.append("<p>Confirma tu dirección de correo</p>");
			sb.append("<p><a href=\"http://localhost:8080/despliegueRegistro/confirmar?id=");
			MessageDigest md=MessageDigest.getInstance("SHA-512");//PARA ENCRIPTAR Y CREAR HASH
			//aumentar la seguridad metiendo en el hash algo mas k user y passwd
			byte[]a=md.digest((req.getParameter("usuario")+req.getParameter("password")).getBytes());//un array de bytes de concatenar usuario+password cifrado
			String hash= DatatypeConverter.printHexBinary(a);//guardar el hash en la base de datos junto con usuario y contraseñ
			sb.append(hash+"\">Confirmar</a></p>");
			//String hash2=HexBin.encode(a);
			
			msg.setContent(sb.toString(),"text/html");//contenido y tipo del contenido
			Transport.send(msg);
			String claveCifrada=cifra(req.getParameter("password"));
			
			//insertamos en la base de datos el usuario,la contraseña y el hash
			insertarUser(hash,req.getParameter("usuario"),claveCifrada);
		
			//redireccionamos a la pagina que muestra el mensaje de confirmar asique tiene que ser .jsp
			req.getRequestDispatcher("/informacionDeRegistro.jsp").forward(req, resp);//pasamos req y resp que recibio la página
			//resp.sendRedirect("informacionDeRegistro.jsp");
			
		} catch (AddressException e) {
			throw new ServletException(e);
		} catch (MessagingException e) {
			throw new ServletException(e);
		} catch (NoSuchAlgorithmException e) {
			throw new ServletException(e);
		} catch (SQLIntegrityConstraintViolationException e) {
			// TODO Auto-generated catch block
			throw new ServletException("ese nombre de usuario ya está registrado");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ServletException(e);
		}

		
	}

	private void insertarUser(String hash, String user, String claveCifrada) throws ServletException, SQLIntegrityConstraintViolationException {
		// TODO Auto-generated method stub
		Connection con=null;
		
		try {
			//encryptar la password
			con=DriverManager.getConnection("jdbc:mysql://localhost/despliegue","root","practicas");
			Statement st= con.createStatement();
			String sentencia="insert into usuarios(user,password,hash) values('"+user+"','"+claveCifrada+"','"+hash+"')";
			int rs=st.executeUpdate(sentencia);
		} catch (SQLException e) {
			throw new ServletException("Error insertando usuario: "+e);
		}
		
	}
	private String cifra(String pal) throws NoSuchAlgorithmException {
		MessageDigest md=MessageDigest.getInstance("SHA-512");//PARA ENCRIPTAR Y CREAR HASH
		byte a[]=md.digest(pal.getBytes());
		String cifrada= DatatypeConverter.printHexBinary(a);
		return cifrada;
	}
}
