package cinemacentral.eoi.servicios;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

	public class Conexion {
	    // Clase conexion a bbdd mysql desde Java con patron Singleton
		//Ejemplo de uso -> Connection con = Conexion.getInstance().getConnection();
		
		
		private static Conexion instancia;
	    private Connection connection;
	    //private String url = "jdbc:mysql://db4free.net:3306/hdbcrud?serverTimezone=UTC";
	    private String url = "jdbc:mysql://localhost:3306/empresa?serverTimezone=UTC";
	    private String username = "josecgra";
	    private String password = "123";

	    private Conexion() throws SQLException {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            this.connection = DriverManager.getConnection(url, username, password);
	        } catch (ClassNotFoundException ex) {
	            System.out.println("Conexion a BD incorrecta : " + ex.getMessage());
	        }
	    }

	    public Connection getConnection() {
	        return connection;
	    }

	    public static Conexion getInstance() throws SQLException {
	        if (instancia == null) {
	        	instancia = new Conexion();
	        } else if (instancia.getConnection().isClosed()) {
	        	instancia = new Conexion();
	        }

	        return instancia;
	    }

}
