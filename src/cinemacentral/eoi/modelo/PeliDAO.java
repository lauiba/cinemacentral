package cinemacentral.eoi.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cinemacentral.eoi.modelo.Peli;
import cinemacentral.eoi.servicios.Conexion;
import cinemacentral.eoi.modelo.Peli;

public class PeliDAO {

	private Connection con;
	private PreparedStatement pst;
	private ResultSet rs;
	
	//objeto tipo peli "p". aplicar método para  
	
	public void altaPeli(Peli p) throws SQLException {
		String sql = "INSERT INTO peli (idpeli, titulo, genero, director, duracion, anyo) VALUES (?, ?, ?, ?, ?, ?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		
		pst.setInt(1, maxIdpeli()+1);
		pst.setString(2, p.getTitulo());
		pst.setString(3, p.getGenero());
		pst.setString(4, p.getDirector());
		pst.setInt(1, p.getDuracion());
		pst.setInt(5, p.getAnyo());
		
		pst.executeUpdate();
		
		pst.close();
		con.close();
}
	//método asignación código peli
	private int maxIdpeli() throws SQLException {
		
		int idp=0;
		
		String sql = "SELECT max(idpeli) FROM usuarios";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		rs= pst.executeQuery();
		
		if (rs.next()) {
			idp=rs.getInt(1);
			
		}
			rs.close();
			pst.close();
			con.close();
			
			return idp;
		}
	
	
	
	public void modificarPeli(Peli p) throws SQLException {

		String sql = "UPDATE peli SET idpeli = ?, titulo = ?, genero = ? WHERE idpeli = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, maxIdpeli()+1);
		pst.setString(2, p.getTitulo());
		pst.setString(3, p.getGenero());
		pst.setString(4, p.getDirector());
		pst.setInt(1, p.getDuracion());
		pst.setInt(5, p.getAnyo());
		
		pst.executeUpdate();
		
		pst.close();
		con.close();

	}

	public void borrarPeli(int idpeli) throws SQLException {

		String sql = "DELETE FROM peli WHERE idpeli = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, idpeli);

		pst.executeUpdate();

	}

	public Peli getPeli(int idpeli) throws SQLException {

		Peli p = null;
		String sql = "SELECT * FROM peli WHERE idpeli = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setInt(1, idpeli);

		rs = pst.executeQuery();

		if (rs.next()) {
			p = new Peli();
			p.setIdpeli(rs.getInt("idpeli"));
			p.setTitulo(rs.getString("titulo"));
			p.setGenero(rs.getString("genero"));
			p.setDirector(rs.getNString("director"));
			p.setDuracion(rs.getInt("duracion"));
			p.setAnyo(rs.getInt("anyo"));
			
			
		}
		
		return p;
	}

	
	
	
}
