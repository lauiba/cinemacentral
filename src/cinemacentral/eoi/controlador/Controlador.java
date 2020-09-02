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
		
		String opcion = request.getParameter("opcion");
		int idpeli = Integer.parseInt(request.getParameter("idpeli"));
		PeliDAO pDao = new PeliDAO();
		Peli p = null;
		
		String pagDest = "home.jsp";
		
		switch (opcion) {
		case "e":
			try {
				p = pDao.getPeli(idpeli);
				request.setAttribute("idpeli", p);
				pagDest = "#";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "b":
			try {
				pDao.borrarPeli(idpeli);;
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
		
<<<<<<< HEAD
		//modifcado los tipos de datos int y aï¿½adido parseint para idpeli, duracion y anyo
		
=======
		//modifcado los tipos de datos int y añadido parseint para idpeli, duracion y anyo
		//int idpeli = Integer.parseInt(request.getParameter("idpeli"));
>>>>>>> 59ef258f35f2f19ce45c321fe6df57d881dd20f6
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
<<<<<<< HEAD
=======
		//p.setIdpeli(idpeli);
>>>>>>> 59ef258f35f2f19ce45c321fe6df57d881dd20f6
		p.setTitulo(titulo);
		p.setGenero(genero); 
		p.setDirector(director);
		p.setDuracion(duracion);
		p.setAnyo(anyo);

		
		PeliDAO pelidao = new PeliDAO();
<<<<<<< HEAD
		//redirigir a pï¿½gina inicio con la lista de pelï¿½culas, una vez insertado la nueva pelï¿½cula
=======
		//redirigir a página inicio con la lista de películas, una vez insertado la nueva película
>>>>>>> 59ef258f35f2f19ce45c321fe6df57d881dd20f6
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
