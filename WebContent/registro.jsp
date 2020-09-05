<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>CinemaCentral</title>
	<meta charset="ISO-8859-1">
</head>
<body>
	<h1>Cinema Central</h1>
	<nav>
		<ul>
			<li style="margin-left: 100px">
				<a href="login.jsp">Volver atrás</a>
			</li>
		</ul>
	</nav>
	<form action="ControladorUsu" method="POST">
		Sofá, palomitas y Acción
		<h2>Regístrate</h2><br>
		<label for="Nom">Nombre</label><br>
		<input type="text" name="nombre" maxlength="12"><br><br>
		<label for="Ape">Apellidos</label><br>
		<input type="text" name="apellidos" maxlength="80" style="width: 240px"><br><br>
		<label for="Correo">Correo</label><br>
		<input type="text" name="correo" maxlength="80" style="width: 240px"><br><br>
		<label for="Pass">Contraseña</label><br>
		<input type="password" name="pass"><br><br>
		<input type="submit" name="Save" value="Guardar cambios">
		<input type="reset" name="Borrar" value="Borrar los datos introducidos">
		<input type="hidden" name="rol" value="usuario">		
	</form>
</body>
</html>