<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.modelo.Peli"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="CSS/PagIntEstilo.css">
<title>Modificar Pel�cula</title>
</head>
<body>

<% 
Peli p = (Peli) request.getAttribute("idpeli");
%>
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
			<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Cerrar sesi�n</a></li>
		</ul>
		</div>
		
	</nav>
	
	<form action="ControladorPeli" method="POST">
		<p class="mod">Modificar pel�cula</p>
		<input type="hidden" name="idpeli" value="<%=p.getIdpeli()%>" >
		<label for="titulo">T�tulo de la pel�cula:</label><br>
		<input type="text" name="titulo" value="<%=p.getTitulo()%>" ><br><br>
		<label for="genero">G�nero:</label><br>
		<input type="text" name="genero" value="<%=p.getGenero()%>" ><br><br>
		<label for="director">Director:</label><br>
		<input type="text" name="director" value="<%=p.getDirector()%>"><br><br>
		<label for="duracion">Duraci�n:</label><br>
		<input type="number" name="duracion" value="<%=p.getDuracion() %>"><br><br>
		<label for="anyo">A�o:</label><br>
		<input type="number" name="anyo" value="<%=p.getAnyo()%>"><br><br>
		<label for="foto">Car�tula:</label><br>
		<input type="text" name="foto" value="<%=p.getFoto()%>"><br><br>
		<input type="hidden" name="opcion" value="e">
		<input type="submit" name="guardar" value="Modificar" class="w3-button w3-black w3-round-xxlarge">
		<a href="home.jsp" >Cancelar</a>
	</form>

</body>
</html>