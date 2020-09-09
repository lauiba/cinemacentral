<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Alta peli</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="CSS/PagIntEstilo.css">
</head>
<body>
	
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    	<div class="navbar-header">	
    	  <a class="navbar-brand" href="home.jsp">Cinema Central</a>
		</div>
			
		<ul class="nav navbar-nav">
			<li class="active"><a href="home.jsp">Películas</a></li>
			<% if (session.getAttribute("rol").equals("admin")) { %>
			<li><a href="listaUsuarios.jsp">Usuarios</a></li>
		<% } %>
		
			<% if (session.getAttribute("rol").equals("admin")) { %>
			<li><a href="altaPeli.jsp">Alta Película</a></li>
		<% } %>
		
		</ul>
		<ul class="nav navbar-nav navbar-right">
			 <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%></a></li>
			<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span>Cerrar sesión</a></li>
		</ul>
		</div>
		
	</nav>
	
	<form action="ControladorPeli" method="POST">
		<label for="titulo">Título de la película:</label><br>
		<input type="text" name="titulo" autofocus required><br><br>
		<label for="genero">Género:</label><br>
		<input type="text" name="genero" required><br><br>
		<label for="director">Director:</label><br>
		<input type="text" name="director" required><br><br>
		<label for="duracion">Duración:</label><br>
		<input type="number" name="duracion" required><br><br>
		<label for="anyo">Año:</label><br>
		<input type="number" name="anyo" required><br><br>
		<label for="foto">Carátula:</label><br>
		<input type="text" name="foto"><br><br>
		<input type="submit" name="guardar" value="Guardar" class="w3-button w3-black w3-round-xxlarge">
		<a href="home.jsp" >Cancelar</a>
	</form>
</body>
</html>