package cinemacentral.eoi.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cinemacentral.eoi.servicios.Conexion;
import cinemacentral.eoi.modelo.Usuario;

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
	
	// Método para modificar un Usuario
	
	public void modificarUsu(Usuario u) throws SQLException {
		
		String sql = "UPDATE usuarios SET nombre = ?, apellidos = ?, correo = ?, pass = ?, rol = ? WHERE idusuario = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		
		pst.setString(1, u.getNombre());
		pst.setString(2, u.getApellidos());
		pst.setString(3, u.getCorreo());
		pst.setString(4, u.getPass());
		pst.setString(5, u.getRol());
		pst.setInt(6, u.getIdusuario());
				
		pst.executeUpdate();
		
		pst.close();
		con.close();
	}
	
	// Método para recoger los datos de Usuario
	
	public Usuario getUsuario(int idusuario) throws SQLException {

		Usuario u = null;
		String sql = "SELECT * FROM usuarios WHERE idusuario = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, idusuario);

		rs = pst.executeQuery();

		if (rs.next()) {
			u = new Usuario();
			u.setIdusuario(rs.getInt("idusuario"));
			u.setNombre(rs.getString("nombre"));
			u.setApellidos(rs.getString("apellidos"));
			u.setCorreo(rs.getString("correo"));
			u.setPass(rs.getString("pass"));
			u.setRol(rs.getString("rol"));
			
			
		}
		
		return u;
	}
	
	// Método para BORRAR los datos de Usuario
	
	public void borrarUsuario(int idusuario) throws SQLException {

		String sql = "DELETE FROM usuarios WHERE idusuario = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, idusuario);

		pst.executeUpdate();

	}
	
}