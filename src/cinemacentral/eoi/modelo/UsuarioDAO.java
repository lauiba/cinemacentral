package cinemacentral.eoi.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cinemacentral.eoi.servicios.Conexion;

public class UsuarioDAO {
	
	// Creamos las conexiones MySQL
	
	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	
	// Generamos el método para el LOGIN de un usuario
	
	public Usuario login(String correo, String pass) throws SQLException {
		
		Usuario u = null;
		String sql = "SELECT nombre, correo, pass, rol FROM usuarios WHERE correo = ? AND pass = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, correo);
		pst.setString(2, pass);
		
		rs = pst.executeQuery();
		
	// Recuperamos los datos para poder mostrarlos despues y utilizarlos
		
		if (rs.next()) {
			u = new Usuario();
			u.setNombre(rs.getNString("nombre"));
			u.setCorreo(rs.getString("correo"));
			u.setPass(rs.getString("pass"));
			u.setRol(rs.getString("rol"));
		}
		
	// Cerramos las conexciones por orden inverso a su apertura
		
			rs.close();
			pst.close();
			con.close();
	
			return u;
		
	}
	
	// Generamos el método para el ALTA de un usuario
	
	public void alta(Usuario a) throws SQLException {
		
		String sql = "INSERT INTO usuarios (idusuario, nombre, apellidos, correo, pass, rol) VALUES (?,?,?,?,?,?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, maxId() + 1);
		pst.setString(2, a.getNombre());
		pst.setString(3, a.getApellidos());
		pst.setString(4, a.getCorreo());
		pst.setString(5, a.getPass());
		pst.setString(6, "Usuario");
		
		pst.executeUpdate();
	
	// Cerramos las conexciones por orden inverso a su apertura
		
		pst.close();
		con.close();
		
	}
	
	// Método para sacar la idUsuario máxima
	
	private int maxId() throws SQLException {
		
		int id = 0;
		
		String sql = "SELECT max(idusuario) FROM usuarios";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		rs = pst.executeQuery();
		
		if (rs.next()) {
			id = rs.getInt(1);
		}
		
			
		return id;
	}
	
}