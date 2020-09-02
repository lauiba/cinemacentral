package cinemacentral.eoi.controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cinemacentral.eoi.modelo.Usuario;
import cinemacentral.eoi.modelo.UsuarioDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// instanciar un DAO 
		// llamar a la funcion login
		// para llamar a esa funcion voy a necesitar los datos de la vista
		
		String correo = request.getParameter("correo");
		String pass = request.getParameter("pass");
		
		UsuarioDAO udao = new UsuarioDAO();
		
		String pagDest = "login.jsp";
		
		try {
			Usuario us = udao.login(correo, pass);
			
			if (us != null) {
				pagDest = "home.jsp";
				HttpSession session = request.getSession();
				session.setAttribute("nombre", us.getNombre());
				session.setAttribute("rol", us.getRol());
			} else {
				String msgerr = "Usuario o contraseña incorrectos!";
				request.setAttribute("msgerr", msgerr);
			}
		} catch (SQLException us) {
			// TODO Auto-generated catch block
			us.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
		dispatcher.forward(request, response);
	
	}

}
