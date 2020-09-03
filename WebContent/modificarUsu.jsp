<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Usuarios</title>
	<meta charset="ISO-8859-1">
</head>
<body>
	
	<h2 style="text-align: right">Bienvenid@ <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%> </h2>
	
	<nav>	
		<ul>
			<li>
				<a href="home.jsp">Inicio</a>
			</li>
			<li>
				<a href="Logout">Cerrar sesión</a>
			</li>
		</ul>
	</nav>
	
	<form action="Controlador" method="POST">
		<label for="nombre">Nombre:</label><br>
		<input type="text" name="nombre"><br><br>
		<label for="apellidos">Apellidos:</label><br>
		<input type="text" name="apellidos"><br><br>
		<label for="corrreo">Correo:</label><br>
		<input type="text" name="correo"><br><br>
		<label for="pass">Contraseña:</label><br>
		<input type="number" name="pass"><br><br>
		<label for="rol">Rol:</label><br>
		<input type="number" name="rol"><br><br>
		<input type="submit" name="modificar" value="Modificar">
	</form>
</body>
</html>