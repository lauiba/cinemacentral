<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.modelo.Peli"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Pel�cula</title>
</head>
<body>

<h2 style="text-align: right">Bienvenid@ <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%> </h2>

<% 
Peli p = (Peli) request.getAttribute("idpeli");
%>
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
	
<h3>Modificar pel�cula</h3>

	<form action="Controlador" method="POST">
	
		<input type="hidden" name="idpeli" value="<%=p.getIdpeli()%>" ><br><br>
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
		<input type="hidden" name="opcion" value="e">
		<input type="submit" name="guardar" value="Modificar">
	</form>

</body>
</html>