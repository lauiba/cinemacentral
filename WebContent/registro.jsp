<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>CinemaCentral</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="CSS/PagExtEstilo.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	
	<form action="ControladorUsu" method="POST">
		<a href="login.jsp" style="text-decoration:none"><p class="headcc">Cinema Central</p></a>
		<p>Sofá, palomitas y acción</p>
		<p class="reg">Regístrate</p><br>
		<label for="Nom">Nombre</label>*<br>
		<input type="text" name="nombre" maxlength="12" autofocus required><br><br>
		<label for="Ape">Apellidos</label><br>
		<input type="text" name="apellidos" maxlength="80"><br><br>
		<label for="Correo">Correo</label>*<br>
		<input type="text" name="correo" maxlength="80" required><br><br>
		<label for="Pass">Contraseña</label>*<br>
		<input type="password" name="pass" required><br><br>
		<input type="submit" name="Save" value="Guardar cambios" class="w3-button w3-black w3-round-xxlarge">
		<input type="reset" name="Borrar" value="Borrar los datos introducidos" class="w3-button w3-black w3-round-xxlarge">
		<input type="hidden" name="rol" value="usuario">	
		<a href="login.jsp">Volver atrás</a>	
	</form>
</body>
</html>