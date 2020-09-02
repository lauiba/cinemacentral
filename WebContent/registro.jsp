<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>CinemaCentral</title>
	<meta charset="utf-8">
</head>
<body>
	<h1>Cinema Central</h1>
	<form action="Controlador" method="POST">
		Sofá, palomitas y Acción
		<h2>Regístrate</h2><br>
		<label for="Nom">Nombre</label><br>
		<input type="text" name="Nom" maxlength="12"><br><br>
		<label for="Ape">Apellidos</label><br>
		<input type="text" name="Ape" maxlength="80" style="width: 240px"><br><br>
		<label for="Correo">Correo</label><br>
		<input type="text" name="Ape" maxlength="80" style="width: 240px"><br><br>
		<label for="Pass">Contraseña</label><br>
		<input type="password" name="Pass"><br><br>
		<input type="submit" name="Save" value="Guardar cambios">
		<input type="reset" name="Borrar" value="Borrar los datos introducidos">
	</form>
</body>
</html>