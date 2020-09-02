<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Alta peli</title>
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
				<a href="Logout">Cerrar sesi�n</a>
			</li>
		</ul>
	</nav>
	
	<form action="Controlador" method="POST">
		<label for="titulo">T�tulo de la pel�cula:</label><br>
		<input type="text" name="titulo"><br><br>
		<label for="genero">G�nero:</label><br>
		<input type="text" name="genero"><br><br>
		<label for="director">Director:</label><br>
		<input type="text" name="director"><br><br>
		<label for="duracion">Duraci�n:</label><br>
		<input type="number" name="duracion"><br><br>
		<label for="anyo">A�o:</label><br>
		<input type="number" name="anyo"><br><br>
		<input type="submit" name="guardar" value="Guardar">
	</form>
</body>
</html>