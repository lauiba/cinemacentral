<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Home</title>
	<meta charset="utf-8">
</head>
<body>
	
	<h2 style="text-align: right">Bienvenid@ <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%> </h2>
	
			<!-- Conexion con la bbdd -->		
	<%
		Connection conn = Conexion.getInstance().getConnection();
		Statement st = conn.createStatement();
		String query = "SELECT * FROM pelis";
		ResultSet rs = st.executeQuery(query);
	%>
			<!-- Barra de navegacion -->
	<nav>	
		<ul>
			<li>
				<a href="Logout" style="text-align: right">Cerrar sesión</a>
			</li>
		</ul>
	</nav>
			<!-- Tabla de datos -->
	<table>
		<caption><b>Lista de películas</b></caption>
		<tr>
			<th>Título</th>
			<th>Género</th>
			<th>Director</th>
			<th>Duración</th>
			<th>Año</th>
	<% if (session.getAttribute("rol").equals("Admin")) { %>
			<th>Acciones</th>
	<% } %>
	</tr>

		<%
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString("titulo")%></td>
			<td><%=rs.getString("genero")%></td>
			<td><%=rs.getString("director")%></td>
			<td><%=rs.getString("duracion")%></td>
			<td><%=rs.getString("anyo")%></td>
	<% if (session.getAttribute("rol").equals("Admin")) { %>		
			<td>ERES ADMIN</td>
	<% } %>
		</tr>

		<%
			}
		%>
	
	</table>	
</body>
</html>