<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Favoritas</title>
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
	 	String query = "SELECT titulo FROM pelis WHERE idpeli IN (SELECT idpeli FROM fav WHERE idusuario = " + session.getAttribute("idusuario") + ")";
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
				
			<!-- Tabla de datos -->
	<table class="table table-condensed" id="tfav">
	
	<tr>
		
		<%	
			int c = 0;
			while (rs.next()) {	
		%>
			
		<td><%=rs.getString("titulo")%><br>
		<a href="#" class="btn btn-info btn-lg">
        <span class="glyphicon glyphicon-star"></span>Quitar</a></td>
			
			
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