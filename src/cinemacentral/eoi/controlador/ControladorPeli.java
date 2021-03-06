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

import cinemacentral.eoi.modelo.Peli;
import cinemacentral.eoi.modelo.PeliDAO;

/**
 * Servlet implementation class ControladorPeli
 */
@WebServlet("/ControladorPeli")
public class ControladorPeli extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorPeli() {
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
		int idU = 0;
		switch (opcion) {
		case "f":
			idU = Integer.parseInt(request.getParameter("idusuario"));	
			
			break;	
		case "bf":
			idU = Integer.parseInt(request.getParameter("idusuario"));	
		
			break;	
		}
		
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
			
		// 23/10/2020 - 26/10/2020 -->
			
		case "d":
			try {
				p= pDao.getPeli(idpeli);
				request.setAttribute("idpeli", p);
				HttpSession session = request.getSession();
				session.setAttribute("idpeli", p.getIdpeli());
				session.setAttribute("titulo", p.getTitulo());
				session.setAttribute("anyo", p.getAnyo());
				pagDest = "FichaPeli.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "b":
			try {
				pDao.borrarPeli(idpeli);
				pagDest = "home.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "f":
			try {
				pDao.favPeli(idpeli, idU);;
				pagDest = "home.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			break; 
		case "bf":
			try {
				pDao.borrarFav(idpeli, idU);;
				pagDest = "fav.jsp";
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
		
		String titulo = request.getParameter("titulo");
		String genero = request.getParameter("genero");
		String director = request.getParameter("director");
		int duracion = Integer.parseInt(request.getParameter("duracion"));
		int anyo = Integer.parseInt(request.getParameter("anyo"));
		String foto = request.getParameter("foto");
		String opcion = request.getParameter("opcion");
		int idpeli = 0;
		
		if (null !=request.getParameter("idpeli")) {
			idpeli =Integer.parseInt(request.getParameter("idpeli"));
		}
		
		Peli p = new Peli();

		p.setIdpeli(idpeli);
		p.setTitulo(titulo);
		p.setGenero(genero); 
		p.setDirector(director);
		p.setDuracion(duracion);
		p.setAnyo(anyo);
		p.setFoto(foto);

		PeliDAO pelidao = new PeliDAO();

		//redirigir a home con la lista de peliculas, una vez insertada la nueva pelicula

		String pagDest = "home.jsp";
		 
		  try {
			if(opcion==null) {
				
				pelidao.altaPeli(p);
				pagDest="home.jsp";
			
			}else
				pelidao.modificarPeli(p);
				pagDest = "home.jsp";

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		RequestDispatcher dispatcher = request.getRequestDispatcher(pagDest);
		dispatcher.forward(request, response);
	}

}
