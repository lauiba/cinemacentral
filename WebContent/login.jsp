<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Login</title>
	<meta charset="ISO-8859-1">
	<style>
		p {
		margin-top: 0px;
		margin-bottom: 0px;
		}	
	</style>
</head>
<body>
	<p style="font-size: 40px">Cinema Central</p>
	<p style="margin-left: 45px">Sof�, palomitas y acci�n</p><br><br>
	<form action="Login" method="POST">
		<label for="correo">Correo</label><br>
		<input type="email" name="correo" style="width: 240px" required> *<br><br>
		<label for="pass">Contrase�a</label><br>
		<input type="password" name="pass" required> *<br>
		<span style="color: red"><%=(request.getAttribute("msgerr") == null) ? "" : request.getAttribute("msgerr") %></span><br>
		<input type="submit" name="Submit" value="Enviar">
		<a href="recuperarPass.jsp"><input type="button" name="�Has olvi?" value="�Has olvidado la contrase�a?"></a><br><br>
		<a href="registro.jsp"><input type="button" name="Registro" value="Reg�strate"></a>
	</form>
</body>
</html>