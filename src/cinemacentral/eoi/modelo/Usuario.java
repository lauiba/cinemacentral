package cinemacentral.eoi.modelo;

public class Usuario {
	
	// Crear los atributos de los usuarios
	
	private int idusuario;
	private String nombre;
	private String apellidos;
	private String correo;
	private String pass;
	private String rol;
	
	// Generamos el constructor SIN argumentos
	
	public Usuario() {
		super();
	}
	
	// Generamos el constructor CON argumentos
	
	public Usuario(int idusuario, String nombre, String apellidos, String correo, String pass,
			String rol) {
		
		super();
		
		this.idusuario = idusuario;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.correo = correo;
		this.pass = pass;
		this.rol = rol;
	}
	
	// Getter y Setter

	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	// Método toString
	
	@Override
	public String toString() {
		return "Usuario [idusuario=" + idusuario + ", nombre=" + nombre + ", apellidos=" + apellidos + ", correo="
				+ correo + ", pass=" + pass + ", rol=" + rol + "]";
	}
	
	
	
	
	

}
