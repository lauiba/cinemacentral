package cinemacentral.eoi.modelo;

public class Peli {
	
	private String idpeli; 
	private String titulo; 
	private String genero; 
	private String director; 
	private String duracion;
	private String a�o;
	
	
	public Peli() {
		super();
		
	}


	public Peli(String idpeli, String titulo, String genero, String director, String duracion, String a�o) {
		super();
		this.idpeli = idpeli;
		this.titulo = titulo;
		this.genero = genero;
		this.director = director;
		this.duracion = duracion;
		this.a�o = a�o;
	}


	public String getIdpeli() {
		return idpeli;
	}


	public void setIdpeli(String idpeli) {
		this.idpeli = idpeli;
	}


	public String getTitulo() {
		return titulo;
	}


	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


	public String getGenero() {
		return genero;
	}


	public void setGenero(String genero) {
		this.genero = genero;
	}


	public String getDirector() {
		return director;
	}


	public void setDirector(String director) {
		this.director = director;
	}


	public String getDuracion() {
		return duracion;
	}


	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}


	public String getA�o() {
		return a�o;
	}


	public void setA�o(String a�o) {
		this.a�o = a�o;
	}
	
	
	
}
