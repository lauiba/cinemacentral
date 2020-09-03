<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<title>Listado Usuarios</title>
</head>
<body>
	
	<h2 style="text-align: right">Bienvenid@ <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%> </h2>
	
				<!-- Conexion con la bbdd -->		
	<%
		Connection conn = Conexion.getInstance().getConnection();
		Statement st = conn.createStatement();
		String query = "SELECT * FROM usuarios";
		ResultSet rs = st.executeQuery(query);
	%>
			<!-- Barra de navegacion -->

	<nav>	
		<ul>
			<li>
				<a href="home.jsp">Inicio</a>
			</li>
						
			<li>
				<a href="Logout">Cerrar sesión</a>
			</li>
		</ul>
	</nav>
			
				<!-- Tabla de datos -->
	<table>
		<caption><b>Lista de Usuarios</b></caption>
		<tr>
			<th>Nombre</th>
			<th>Apellidos</th>
			<th>Correo</th>
			<th>Contraseña</th>
			<th>Rol</th>
			<th>Acciones</th>
	</tr>

		<%
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString("nombre")%></td>
			<td><%=rs.getString("apellidos")%></td>
			<td><%=rs.getString("correo")%></td>
			<td><%=rs.getString("pass")%></td>
			<td><%=rs.getString("rol")%></td>
		
			<td><a href="Controlador?opcion=e&idusuario=<%=rs.getInt("idusuario") %>">Modificar</a>
			<a href="Controlador?opcion=b&idusuario=<%=rs.getInt("idusuario") %>">Borrar</a></td>

		</tr>

		<%
			}
		%>
	
	</table>
	
</body>
</html>