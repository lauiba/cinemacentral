package cinemacentral.eoi.controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinemacentral.eoi.modelo.Peli;
import cinemacentral.eoi.modelo.PeliDAO;


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
		String idpeli = request.getParameter("idpeli");
		String titulo = request.getParameter("titulo");
		String genero = request.getParameter("genero");
		String director = request.getParameter("director");
		String duracion = request.getParameter("duracion");
		String año = request.getParameter("año");
		
		//idpeli, titulo, genero, director, duracion, año
		
		Peli p = new Peli();
		p.setIdpeli(idpeli);
		p.setTitulo(titulo);
		p.setGenero(genero); 
		p.setDirector(director);
		p.setDuracion(duracion);
		p.setAño(año);
		
		
		PeliDAO pelidao = new PeliDAO();	
		try {
			pelidao.altaPeli(p);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
