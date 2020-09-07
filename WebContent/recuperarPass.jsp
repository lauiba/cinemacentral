<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Cambio Contraseña</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="CSS/PagExtEstilo.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	
	<%
		Usuario u = (Usuario) request.getAttribute("correo");		
	%>
	
	<form action="ControladorPass" method="POST">
		<a href="login.jsp" style="text-decoration:none"><p class="headcc">Cinema Central</p></a>
		<p>Sofá, palomitas y acción</p><br>
		<label for="Correo">Correo</label> *<br>
		<input type="text" name="correo" maxlength="80" style="width: 240px" required readonly value="<%=u.getCorreo()%>"><br><br>
		<label for="Pass">Contraseña</label> *<br>
		<input type="password" name="pass" required><br><br>
		<input type="submit" name="Save" value="Guardar cambios" class="w3-button w3-black w3-round-xxlarge">
		<input type="hidden" name="idusuario" value="<%=u.getIdusuario()%>">	
		<input type="hidden" name="nombre" value="<%=u.getNombre()%>">
		<input type="hidden" name="apellidos" value="<%=u.getApellidos()%>">
		<input type="hidden" name="rol" value="<%=u.getRol()%>">
		<input type="hidden" name="opcion" value="e">
		<a href="olvidoPass.jsp"> Volver atrás</a>
		
	</form>
</body>
</html>