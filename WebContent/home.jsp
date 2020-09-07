<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Home</title>
	<meta charset="ISO-8859-1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="CSS/PagIntEstilo.css">
</head>
<body>
		
			<!-- Conexion con la bbdd -->		
	<%
		Connection conn = Conexion.getInstance().getConnection();
		Statement st = conn.createStatement();
		String query = "SELECT * FROM pelis";
		ResultSet rs = st.executeQuery(query);
	%>
			<!-- Barra de navegacion -->

	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    	<div class="navbar-header">	
    	  <a class="navbar-brand" href="home.jsp">Cinema Central</a>
		</div>
		
		<ul class="nav navbar-nav">
			<li class="active"><a href="home.jsp">Home</a></li>
			<% if (session.getAttribute("rol").equals("admin")) { %>
			<li><a href="listaUsuarios.jsp">Listado Usuarios</a></li>
			
			<% } %>
			
			<% if (session.getAttribute("rol").equals("admin")) { %>
			<li><a href="altaPeli.jsp">Alta Pel�cula</a></li>
			<% } %>
	
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%></a></li>
			<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span>Cerrar sesi�n</a></li>
		</ul>
		</div>
	</nav>
	
				<!-- Tabla de datos -->
	<table class="table table-striped">
		<caption><b>Lista de pel�culas</b></caption>
		<tr>
			<th>T�tulo</th>
			<th>G�nero</th>
			<th>Director</th>
			<th>Duraci�n</th>
			<th>A�o</th>
			<th>Acciones</th>	
	</tr>

		<%
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString("titulo")%></td>
			<td><%=rs.getString("genero")%></td>
			<td><%=rs.getString("director")%></td>
			<td><%=rs.getString("duracion")%></td>
			<td><%=rs.getString("anyo")%></td>
		<% if (session.getAttribute("rol").equals("usuario")) { %>
			<td><a href="ControladorPeli?opcion=f&idpeli=<%=rs.getInt("idpeli") %>&idusuario=<%=session.getAttribute("idusuario")%>"><span class="glyphicon glyphicon-star-empty"></span></a></td>
		<% } %>		
		<% if (session.getAttribute("rol").equals("admin")) { %>
			<td><a href="ControladorPeli?opcion=e&idpeli=<%=rs.getInt("idpeli") %>"><span class="glyphicon glyphicon-pencil"></span></a>    
			<a href="ControladorPeli?opcion=b&idpeli=<%=rs.getInt("idpeli") %>"><span class="glyphicon glyphicon-trash"></span></a></td>
		
		<% } %>
		</tr>

		<%
			}
		%>
	
	</table>
	
	<% if (session.getAttribute("rol").equals("usuario")) { %>
		
	<% } %>		
	

</body>
</html>