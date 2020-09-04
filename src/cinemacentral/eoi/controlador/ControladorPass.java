package cinemacentral.eoi.controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinemacentral.eoi.modelo.Usuario;
import cinemacentral.eoi.modelo.UsuarioDAO;

/**
 * Servlet implementation class ControladorPass
 */
@WebServlet("/ControladorPass")
public class ControladorPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// Recuperar PASS
		
		String correo = request.getParameter("correo");
		UsuarioDAO uDao = new UsuarioDAO();
		Usuario u = null;
		
		String pagDest = "home.jsp";
		
		try {
			u = uDao.getPass(correo);
			request.setAttribute("correo", u);
			pagDest = "recuperarPass.jsp";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Recuperar PASS
		
		int idusu = Integer.parseInt(request.getParameter("idusuario"));
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String correo = request.getParameter("correo");
		String pass = request.getParameter("pass");
		String rol = request.getParameter("rol");
		
		Usuario u = new Usuario();	
		u.setIdusuario(idusu);
		u.setNombre(nombre);
		u.setApellidos(apellidos);
		u.setCorreo(correo);
		u.setPass(pass);
		u.setRol(rol);
		
		UsuarioDAO usuariodao = new UsuarioDAO();
		String pagDest = "login.jsp";
		
		try {
			usuariodao.modificarUsu(u);
			pagDest = "login.jsp";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 	
		RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
		dispatcher.forward(request, response);
		
	}
}
