<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Favoritas</title>
	<meta charset="ISO-8859-1">
</head>
<body>
	<h2 style="text-align: right">Bienvenid@ <%=session.getAttribute("nombre")%></h2>
	
			<!-- Conexion con la bbdd -->		
	<%
		Connection conn = Conexion.getInstance().getConnection();
		Statement st = conn.createStatement();
		String query = "SELECT * FROM fav";
		ResultSet rs = st.executeQuery(query);
	%>
			<!-- Barra de navegacion -->
				
			<!-- Tabla de datos -->
	<table>
		<caption><b>Lista de películas</b></caption>
		<tr>
			<th>Título</th>
			<th>Género</th>
			<th>Director</th>
			<th>Duración</th>
			<th>Año</th>				
		</tr>

		<%
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString("idpeli")%></td>
					
		</tr>		
	<% } %>	
	</table>			
				
				
				
</body>
</html>