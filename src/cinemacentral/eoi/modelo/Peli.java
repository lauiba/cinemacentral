package cinemacentral.eoi.modelo;

public class Peli {
	
	private int idpeli; 
	private String titulo; 
	private String genero; 
	private String director; 
	private int duracion;
	private int anyo;
	private String foto;
	
	
	public Peli() {
		super();
		
	}


	public Peli(int idpeli, String titulo, String genero, String director, int duracion, int anyo, String foto) {


		super();
		this.idpeli = idpeli;
		this.titulo = titulo;
		this.genero = genero;
		this.director = director;
		this.duracion = duracion;
		this.anyo = anyo;
		this.foto = foto;

	}


	public int getIdpeli() {
		return idpeli;
	}


	public void setIdpeli(int idpeli) {
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


	public int getDuracion() {
		return duracion;
	}


	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}


	public int getAnyo() {
		return anyo;
	}


	public void setAnyo(int anyo) {
		this.anyo = anyo;
	}
	
	public String getFoto() {
		return foto;
	}


	public void setFoto(String foto) {
		this.foto = foto;
	}


	@Override
	public String toString() {
		return "Peli [idpeli=" + idpeli + ", titulo=" + titulo + ", genero=" + genero + ", director=" + director
				+ ", duracion=" + duracion + ", anyo=" + anyo + ", foto=" + foto + "]";
	}

	
}
