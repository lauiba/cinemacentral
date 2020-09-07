<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Login</title>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="CSS/LoginEstilo.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<form action="Login" method="POST">
		<a href="login.jsp" style="text-decoration:none"><p class="headcc">Cinema Central</p></a>
		<p >Sofá, palomitas y acción</p><br>
		<label for="correo">Correo</label><br>
		<input type="email" name="correo" autofocus required> *<br><br>
		<label for="pass">Contraseña</label><br>
		<input type="password" name="pass" required> *<br>
		<span class="error"><%=(request.getAttribute("msgerr") == null) ? "" : request.getAttribute("msgerr") %></span><br>
		<input type="submit" name="Submit" value="Enviar" class="w3-button w3-black w3-round-xxlarge">
		<a href="olvidoPass.jsp"><input type="button" name="¿Has olvi?" value="¿Has olvidado la contraseña?" class="w3-button w3-black w3-round-xxlarge"></a><br><br>
		<a href="registro.jsp"><input type="button" name="Registro" value="Regístrate" class="w3-button w3-black w3-round-xxlarge"></a>
	</form>
</body>
</html>