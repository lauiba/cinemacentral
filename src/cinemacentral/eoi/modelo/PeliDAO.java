package cinemacentral.eoi.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;





import java.sql.Statement;


import cinemacentral.eoi.servicios.Conexion;


public class PeliDAO {

	private Connection con;
	private PreparedStatement pst;
	private PreparedStatement pst1;
	private ResultSet rs;
	private Statement st;
	

	//objeto tipo peli "p". aplicar m�todo para  


	
	public void altaPeli(Peli p) throws SQLException {
		String sql = "INSERT INTO pelis (idpeli, titulo, genero, director, duracion, anyo) VALUES (?, ?, ?, ?, ?, ?)";

		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		
		pst.setInt(1, maxIdpeli()+1);
		pst.setString(2, p.getTitulo());
		pst.setString(3, p.getGenero());
		pst.setString(4, p.getDirector());
		pst.setInt(5, p.getDuracion());
		pst.setInt(6, p.getAnyo());
		
		pst.executeUpdate();
		
		pst.close();
		con.close();
}
	//m�todo asignaci�n c�digo peli
	private int maxIdpeli() throws SQLException {
		
		int idp=0;
		
		String sql = "SELECT max(idpeli) FROM pelis";
		con = Conexion.getInstance().getConnection();
		st = con.createStatement();
		rs = st.executeQuery(sql);
		
		
		if (rs.next()) {
			idp=rs.getInt(1);
			
		}

			return idp;
		}
	
	
	
	public void modificarPeli(Peli p) throws SQLException {

		String sql = "UPDATE pelis SET titulo = ?, genero = ?, director = ?, duracion = ?, anyo = ? WHERE idpeli = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst.setString(1, p.getTitulo());
		pst.setString(2, p.getGenero());
		pst.setString(3, p.getDirector());
		pst.setInt(4, p.getDuracion());
		pst.setInt(5, p.getAnyo());
		pst.setInt(6, p.getIdpeli());  //solo mostrar idpeli sin posibilidad de editarlo
		//---modificado orden segun orden query
		
		pst.executeUpdate();
		
		pst.close();
		con.close();

	}

	public void borrarPeli(int idpeli) throws SQLException {

		String sql = "DELETE FROM fav WHERE idpeli = ?";
		String sql1 = "DELETE FROM pelis WHERE idpeli = ?";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		pst1 = con.prepareStatement(sql1);
		pst.setInt(1, idpeli);
		pst1.setInt(1, idpeli);

		pst.executeUpdate();
		pst1.executeUpdate();

	}

	public Peli getPeli(int idpeli) throws SQLException {

		Peli p = null;
		String sql = "SELECT * FROM pelis WHERE idpeli = ?";
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

	    public void favPeli(int idpeli, int idusuario) throws SQLException {
		
		String sql = "INSERT INTO fav (idpeli, idusuario) VALUES (?, ?)";
		con = Conexion.getInstance().getConnection();
		pst = con.prepareStatement(sql);
		
		pst.setInt(1, idpeli);
		pst.setInt(2, idusuario);
		
		pst.executeUpdate();
		
		pst.close();
		con.close();
		
	}
	
	
}
