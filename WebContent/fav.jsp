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
		<caption><b>Lista de pel�culas</b></caption>
		<tr>
			<th>T�tulo</th>
			<th>G�nero</th>
			<th>Director</th>
			<th>Duraci�n</th>
			<th>A�o</th>				
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