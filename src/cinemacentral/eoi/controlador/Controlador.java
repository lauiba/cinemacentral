package cinemacentral.eoi.controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinemacentral.eoi.modelo.Peli;
import cinemacentral.eoi.modelo.PeliDAO;
import cinemacentral.eoi.modelo.Usuario;
import cinemacentral.eoi.modelo.UsuarioDAO;


/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlador() {
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
		
		//modifcado los tipos de datos int y añadido parseint para idpeli, duracion y anyo
		//int idpeli = Integer.parseInt(request.getParameter("idpeli"));
		String titulo = request.getParameter("titulo");
		String genero = request.getParameter("genero");
		String director = request.getParameter("director");
		int duracion = Integer.parseInt(request.getParameter("duracion"));
		int anyo = Integer.parseInt(request.getParameter("anyo"));
		//String opcion = request.getParameter("opcion");
		
		//variables para registro usuario
		 String nombre = request.getParameter("nombre");
		 String apellidos = request.getParameter("apellidos");
		 String correo = request.getParameter("correo");
		 String pass = request.getParameter("pass");
		 
		 Usuario u = new Usuario();	
		 u.setNombre(nombre);
		 u.setApellidos(apellidos);
		 u.setCorreo(correo);
		 u.setPass(pass);
		 
		 UsuarioDAO usuariodao = new UsuarioDAO();
		 String pagDestUsuario = "login.jsp";
		 
		 try {
				usuariodao.alta(u);
				RequestDispatcher dispatcher = request.getRequestDispatcher(pagDestUsuario);
				dispatcher.forward(request, response);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
		//idpeli, titulo, genero, director, duracion, anyo
		
		Peli p = new Peli();
		//p.setIdpeli(idpeli);
		p.setTitulo(titulo);
		p.setGenero(genero); 
		p.setDirector(director);
		p.setDuracion(duracion);
		p.setAnyo(anyo);

		
		PeliDAO pelidao = new PeliDAO();
		//redirigir a página inicio con la lista de películas, una vez insertado la nueva película
		String pagDest = "home.jsp";
		
		
		try {
			pelidao.altaPeli(p);
			RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
			dispatcher.forward(request, response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
		dispatcher.forward(request, response);
		
	}
	
	
	

}
