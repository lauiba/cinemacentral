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
		Usuario u = (Usuario) request.getAttribute("idusuario");		
	%>
	
	<form action="ControladorUsu" method="POST">
		<label for="Correo">Correo</label> *<br>
		<input type="text" name="correo" maxlength="80" style="width: 240px" required><br><br>
		<label for="Pass">Contraseña</label> *<br>
		<input type="password" name="pass" required><br><br>
<%// 	<label for="Pass">Repetir contraseña</label> *<br>	%>
<%//	<input type="password" name="pass" required><br><br>	%>
		<input type="submit" name="Save" value="Guardar cambios">
		
		<input type="hidden" name="idusuario" value="<%=u.getIdusuario()%>">	
		<input type="hidden" name="nombre" value="<%=u.getNombre()%>">
		<input type="hidden" name="apellidos" value="<%=u.getApellidos()%>">
		<input type="hidden" name="rol" value="<%=u.getRol()%>">
		<input type="hidden" name="opcion" value="e">
		
		
	</form>
</body>
</html>