<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Cambio Contraseña</title>
	<meta charset="ISO-8859-1">
</head>
<body>
	<h1>Cinema Central</h1>
	
	<%
		Usuario u = (Usuario) request.getAttribute("correo");		
	%>
	
	<form action="ControladorPass" method="GET">
		<label for="Correo">Correo</label> *<br>
		<input type="text" name="correo" maxlength="80" style="width: 240px" required><br><br>
		<input type="submit" name="Sent" value="Enviar">
	</form>
</body>
</html>