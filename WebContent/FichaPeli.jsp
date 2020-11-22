<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="CSS/PagIntEstilo.css">
		
<title><%=session.getAttribute("titulo")%> (<%=session.getAttribute("anyo")%>)</title>
</head>
<body>

	
			<!-- Conexion con la bbdd -->		
	<%
		Connection conn = Conexion.getInstance().getConnection();
		Statement st = conn.createStatement();
		String query = "SELECT * FROM pelis WHERE idpeli=" + session.getAttribute("idpeli");
		ResultSet rs = st.executeQuery(query);
	%>
	
	<!-- Barra de navegacion -->
			
		<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    	<div class="navbar-header">	
    	  <a class="navbar-brand" href="home.jsp">Cinema Central</a>
		</div>
		
		<ul class="nav navbar-nav">
			<li class="active"><a href="home.jsp">Películas</a></li>
			<% if (session.getAttribute("rol").equals("usuario")) { %>
			<li><a href="fav.jsp">Mis favoritas</a></li>
			<% } %>
			
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="ControladorUsu?opcion=e&idusuario=<%=session.getAttribute("idusuario")%>"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%></a></li>
			<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Cerrar sesión</a></li>
		</ul>
		</div>
	</nav>
	
	<!-- Ficha peli -->
	
	
<table class="table" style="color: white">
	
		<%
		
			while (rs.next()) {
		%>
		<tr>
			<td rowspan="3"><iframe width="560" height="315" src=<%=rs.getString("trailer")%> allowfullscreen></iframe></td>
			<td rowspan=><p>Sinopsis</p><br><%=rs.getString("descripcion")%></td>
			
		</tr>
		
		
		
		<tr>
			<td><p>Director</p><br> <%=rs.getString("director")%> </td>
		</tr>
			
		
		<tr>
			<td><p>Año</p><br> <%=rs.getString("anyo")%> </td>
		</tr>
		
		<tr>
			<td><%=rs.getString("titulo")%> <br>
			<a href="ControladorPeli?opcion=f&idpeli=<%=rs.getInt("idpeli") %>&idusuario=<%=session.getAttribute("idusuario")%>" class="btn btn-info btn-lg" id="botFav">
	        <span class="glyphicon glyphicon-star"></span>Favorita</a> </td>
			<td><p>Género</p><%=rs.getString("genero")%></td>
			<td><p>Duración</p><%=rs.getString("duracion")%></td>
		</tr>
		
		<!-- botón fav desde ficha peli lleva a Home** agregar opcion en controlador? -->
		<tr>
			<td><p> Películas similares </p> </td> 
	   </tr>
				
		<% } %>	
	</table>
	
	
	
</body>
</html>