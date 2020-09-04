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
 * Servlet implementation class Controlador
 */
@WebServlet("/ControladorUsu")
public class ControladorUsu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorUsu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Método para Eliminar o Modificar un Usuario
		
		String opcion = request.getParameter("opcion");
		int idusuario = Integer.parseInt(request.getParameter("idusuario"));
		UsuarioDAO uDao = new UsuarioDAO();
		Usuario u = null;
		
		String pagDest = "home.jsp";
			
		switch (opcion) {
		case "e":
			try {
				u = uDao.getUsuario(idusuario);
				request.setAttribute("idusuario", u);
				pagDest = "modificarUsu.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "b":
			try {
				uDao.borrarUsuario(idusuario);
				pagDest = "listaUsuarios.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
				
		RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Método para el ALTA de un Usuario
		
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String correo = request.getParameter("correo");
		String pass = request.getParameter("pass");
		String rol = request.getParameter("rol");
		String opcion = request.getParameter("opcion");
		int idusuario = 0;
		
		if (null != request.getParameter("idusuario")) {
			idusuario = Integer.parseInt(request.getParameter("idusuario"));
		}
		
		Usuario u = new Usuario();	
		u.setIdusuario(idusuario);
		u.setNombre(nombre);
		u.setApellidos(apellidos);
		u.setCorreo(correo);
		u.setPass(pass);
		u.setRol(rol);
		 
		UsuarioDAO usuariodao = new UsuarioDAO();
		String pagDest = "home.jsp";
		
		try {
			if (opcion == null) { 
				usuariodao.alta(u);
				pagDest = "login.jsp";
			 	
			}else
				usuariodao.modificarUsu(u);
			 	pagDest = "listaUsuarios.jsp";
				
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
		dispatcher.forward(request, response);
		 
	}
	
}
