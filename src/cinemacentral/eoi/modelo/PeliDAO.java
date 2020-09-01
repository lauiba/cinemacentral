package cinemacentral.eoi.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cinemacentral.eoi.modelo.Peli;
import cinemacentral.eoi.servicios.Conexion;

public class PeliDAO {

	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	
	//objeto tipo departamento "d"
	
	public void altaPeli(Peli p) throws SQLException {
		String sql = "INSERT INTO peli (idpeli, titulo, genero, director, duracion, año) VALUES (?, ?, ?, ?, ?, ?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		
		pst.setString(1, p.getIdpeli());
		pst.setString(2, p.getTitulo());
		pst.setString(3, p.getGenero());
		pst.setString(4, p.getDirector());
		
		pst.executeUpdate();
		
}
	
}
