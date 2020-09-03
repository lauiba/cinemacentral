<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Home</title>
	<meta charset="ISO-8859-1">
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
		
		<% if (session.getAttribute("rol").equals("admin")) { %>
	
			<li>
				<a href="listaUsuarios.jsp">Listado Usuarios</a>
			</li>
			
		<% } %>
			
			<li>
				<a href="Logout">Cerrar sesión</a>
			</li>
		</ul>
	</nav>
	<% if (session.getAttribute("rol").equals("admin")) { %>
		<a href="altaPeli.jsp"><input type="button" name="alta" value="Alta película"></a>
	<% } %>
	
	
			<!-- Tabla de datos -->
	<table>
		<caption><b>Lista de películas</b></caption>
		<tr>
			<th>Título</th>
			<th>Género</th>
			<th>Director</th>
			<th>Duración</th>
			<th>Año</th>
	<% if (session.getAttribute("rol").equals("admin")) { %>
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
			
		<% if (session.getAttribute("rol").equals("admin")) { %>	
		
			<td><a href="ControladorPeli?opcion=e&idpeli=<%=rs.getInt("idpeli") %>">Modificar</a>
			<a href="ControladorPeli?opcion=b&idpeli=<%=rs.getInt("idpeli") %>">Borrar</a></td>
			
		<% } %>
		</tr>

		<%
			}
		%>
	
	</table>	
</body>
</html>