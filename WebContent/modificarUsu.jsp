<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Usuarios</title>
	<meta charset="ISO-8859-1">
</head>
<body>
	
	<h2 style="text-align: right">Bienvenid@ <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%> </h2>
	<%
		Usuario u = (Usuario) request.getAttribute("idusuario");		
	%>
	<nav>	
		<ul>
			<li>
				<a href="home.jsp">Inicio</a>
			</li>
			<li>
				<a href="listaUsuarios.jsp">Listado Usuarios</a>
			</li>
			<li>
				<a href="Logout">Cerrar sesión</a>
			</li>
		</ul>
	</nav>
	
	<form action="ControladorUsu" method="POST">
		<input type="hidden" name="idusuario" value="<%=u.getIdusuario()%>">
		<label for="nombre">Nombre:</label><br>
		<input type="text" name="nombre" value="<%=u.getNombre()%>"><br><br>
		<label for="apellidos">Apellidos:</label><br>
		<input type="text" name="apellidos" value="<%=u.getApellidos()%>"><br><br>
		<label for="corrreo">Correo:</label><br>
		<input type="text" name="correo" value="<%=u.getCorreo()%>"><br><br>
		<label for="pass">Contraseña:</label><br>
		<input type="text" name="pass" value="<%=u.getPass()%>"><br><br>
		<label for="rol">Rol:</label><br>
		<input type="text" name="rol" value="<%=u.getRol()%>"><br><br>
		<input type="hidden" name="opcion" value="e">
		<input type="submit" name="modificar" value="Modificar">
	</form>
</body>
</html>