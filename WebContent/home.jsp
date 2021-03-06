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
 	
 	<script>
	function confirmar() {
	return confirm("�Est�s seguro de querer eliminar esta pel�cula? Esta acci�n no se puede deshacer.")
}
	</script>
	
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
			<li class="active"><a href="home.jsp">Pel�culas</a></li>
			<% if (session.getAttribute("rol").equals("usuario")) { %>
			<li><a href="fav.jsp">Mis favoritas</a></li>
			<% } %>
			<% if (session.getAttribute("rol").equals("admin")) { %>
			<li><a href="listaUsuarios.jsp">Usuarios</a></li>
			<li><a href="altaPeli.jsp">Alta Pel�cula</a></li>
			<% } %>
	
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="ControladorUsu?opcion=e&idusuario=<%=session.getAttribute("idusuario")%>"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%></a></li>
			<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Cerrar sesi�n</a></li>
		</ul>
		</div>
	</nav>
	
				<!-- Tabla de datos -->
				
	<% if (session.getAttribute("rol").equals("admin")) { %>
	
	<table class="table" id="tadmin">
		<caption><b>Lista de pel�culas</b></caption>

		<tr>
			<th>T�tulo</th>
			<th>G�nero</th>
			<th>Director</th>
			<th>Duraci�n</th>
			<th>A�o</th>
			<th>Foto</th>
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
			<td><%=rs.getString("foto")%></td>	
			<td><a href="ControladorPeli?opcion=e&idpeli=<%=rs.getInt("idpeli") %>"><span class="glyphicon glyphicon-pencil"></span></a>    
			<a href="ControladorPeli?opcion=b&idpeli=<%=rs.getInt("idpeli") %>" onclick="return confirmar()"><span class="glyphicon glyphicon-trash"></span></a></td>
		</tr>

		<%
			}
		%>
	
	</table>
	
	<% } %>
	
	<% if (session.getAttribute("rol").equals("usuario")) { %>
	
	<table class="table table-condensed" id="tusuario">
	
		<tr>
		
		<%	
			int c = 0;
			while (rs.next()) {	
		%>
			
			<td><a href="ControladorPeli?opcion=d&idpeli=<%=rs.getInt("idpeli") %>&idusuario=<%=session.getAttribute("idusuario")%>"><img src="IMG/<%=rs.getString("foto")%>"></a><br><br>
			<h3><a href="ControladorPeli?opcion=d&idpeli=<%=rs.getInt("idpeli") %>&idusuario=<%=session.getAttribute("idusuario")%>"><b><%=rs.getString("titulo")%></b></a></h3><br>
			<a href="ControladorPeli?opcion=f&idpeli=<%=rs.getInt("idpeli") %>&idusuario=<%=session.getAttribute("idusuario")%>" class="btn btn-info btn-lg" id="botFav">
	        <span class="glyphicon glyphicon-star"></span>Favorita</a></td>

			
		<%
			c++;
				if ((c % 3) == 0) {
		%>
			</tr><tr>
		<%		
				}
			}
		%>
		
		</tr>

	</table>
		
	<% } %>		
	
	
	<!-- :) botoncito scroll top -->
	
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	<script>

	var mybutton = document.getElementById("myBtn");

	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
  		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    	mybutton.style.display = "block";
 		 } else {
    	mybutton.style.display = "none";
  	}
}


	function topFunction() {
  	document.body.scrollTop = 0;
  	document.documentElement.scrollTop = 0;
}
	</script>
	
	
</body>
</html>