<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Cambio Contrase�a</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="CSS/PagExtEstilo.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
		
	<%
		Usuario u = (Usuario) request.getAttribute("correo");		
	%>
	
	<form action="ControladorPass" method="GET">
		<a href="login.jsp" style="text-decoration:none"><p class="headcc">Cinema Central</p></a>
		<p>Sof�, palomitas y acci�n</p><br>
		<p class="reg">Recupera tu contrase�a</p><br>
		<label for="Correo">Correo</label> *<br>
		<input type="text" name="correo" maxlength="80" autofocus required><br><br>
		<input type="submit" name="Sent" value="Enviar" class="w3-button w3-black w3-round-xxlarge">
		<a href="login.jsp"> Cancelar</a>
	</form>
</body>
</html>