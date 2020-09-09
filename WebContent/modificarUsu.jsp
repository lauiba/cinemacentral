<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Usuarios</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="CSS/PagIntEstilo.css">
</head>
<body>
	
	<%
		Usuario u = (Usuario) request.getAttribute("idusuario");		
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
			<li><a href="altaPeli.jsp">Alta Película</a></li>
		<% } %>
		
		</ul>
		<ul class="nav navbar-nav navbar-right">
			   <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%></a></li>
			<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Cerrar sesión</a></li>
		</ul>
		</div>
		
	</nav>
	
	
	<form class="formint" action="ControladorUsu" method="POST">
		<p class="mod">Modificar usuario</p>
		<input type="hidden" name="idusuario" value="<%=u.getIdusuario()%>">
		<label for="nombre">Nombre:</label><br>
		<input type="text" name="nombre" value="<%=u.getNombre()%>" autofocus><br><br>
		<label for="apellidos">Apellidos:</label><br>
		<input type="text" name="apellidos" value="<%=u.getApellidos()%>"><br><br>
		<label for="corrreo">Correo:</label><br>
		<input type="text" name="correo" value="<%=u.getCorreo()%>"><br><br>
		<label for="pass">Contraseña:</label><br>
		<input type="text" name="pass" value="<%=u.getPass()%>"><br><br>
		<% if (session.getAttribute("rol").equals("admin")) { %>
		<label for="rol">Rol:</label><br>
		<input type="text" name="rol" value="<%=u.getRol()%>"><br><br>
		<% } %>
		<% if (session.getAttribute("rol").equals("usuario")) { %>
		<input type="hidden" name="rol" value="<%=u.getRol()%>">
		<% } %>
		<input type="hidden" name="opcion" value="e">
		<input type="submit" name="modificar" value="Modificar" class="w3-button w3-black w3-round-xxlarge">
		<a href="home.jsp" >Cancelar</a>
	</form>
	
</body>
</html>