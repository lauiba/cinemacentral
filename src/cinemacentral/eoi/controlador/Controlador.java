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
		
		// :) Metodo para Eliminar o Modificar una Pelicula
		
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
				pagDest = "modificarPeli.jsp";
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
		
		// Metodo para Eliminar o Modificar un Usuario
		
				/*opcion = request.getParameter("opcion");
				int idusuario = Integer.parseInt(request.getParameter("idusuario"));
				UsuarioDAO uDao = new UsuarioDAO();
				Usuario u = null;
				
				pagDest = "home.jsp";
				
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
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
				
				dispatcher = request.getRequestDispatcher(pagDest);
				dispatcher.forward(request, response); 
		
		*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Metodo para el ALTA de un Usuario

		/* String nombre = request.getParameter("nombre");
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
		 
		 */
		 
		// :) Metodo para dar de ALTA una Pelicula
		
		String titulo = request.getParameter("titulo");
		String genero = request.getParameter("genero");
		String director = request.getParameter("director");
		int duracion = Integer.parseInt(request.getParameter("duracion"));
		int anyo = Integer.parseInt(request.getParameter("anyo"));
		String opcion = request.getParameter("opcion");
		
		Peli p = new Peli();

		p.setTitulo(titulo);
		p.setGenero(genero); 
		p.setDirector(director);
		p.setDuracion(duracion);
		p.setAnyo(anyo);

		
		PeliDAO pelidao = new PeliDAO();

		//redirigir a home con la lista de peliculas, una vez insertada la nueva pelicula

		String pagDest = "home.jsp";
		
		/* modificar peli?
		try {
			if (opcion == null)
				pelidao.modificarPeli(p);
			else 
				pelidao.altaPeli(p);
			pagDest = "home.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
			dispatcher.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		*/
		
		 
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
