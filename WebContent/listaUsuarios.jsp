<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cinemacentral.eoi.servicios.Conexion" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="CSS/PagIntEstilo.css">
 		<script language="javascript">

	function confirmar() {
	return confirm("¿Estás seguro de querer eliminar esta película? Esta acción no se puede deshacer.")
}
	</script>
<title>Usuarios</title>
</head>
<body>
	
				<!-- Conexion con la bbdd -->		
	<%
		Connection conn = Conexion.getInstance().getConnection();
		Statement st = conn.createStatement();
		String query = "SELECT * FROM usuarios";
		ResultSet rs = st.executeQuery(query);
	%>
			<!-- Barra de navegacion -->

	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    	<div class="navbar-header">	
    	  <a class="navbar-brand" href="home.jsp">Cinema Central</a>
		</div>
		
		<ul class="nav navbar-nav">
			<li class="active"><a href="home.jsp">Películas</a></li>
			<% if (session.getAttribute("rol").equals("admin")) { %>
			<li><a href="listaUsuarios.jsp">Usuarios</a></li>
		<% } %>
		
			<% if (session.getAttribute("rol").equals("admin")) { %>
			<li><a href="altaPeli.jsp">Alta Película</a></li>
		<% } %>
		
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="ControladorUsu?opcion=e&idusuario=<%=session.getAttribute("idusuario")%>"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("nombre")%> - <%=session.getAttribute("rol")%></a></li>
			<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span>Cerrar sesión</a></li>
		</ul>
		</div>
		
	</nav>
			
				<!-- Tabla de datos -->
	<table class="table" id="tadusus">
		<caption><b>Usuarios</b></caption>
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
		
			<td><a href="ControladorUsu?opcion=e&idusuario=<%=rs.getInt("idusuario") %>"> <span class="glyphicon glyphicon-pencil"></span></a>
			<a href="ControladorUsu?opcion=b&idusuario=<%=rs.getInt("idusuario") %>" onclick="return confirmar()"><span class="glyphicon glyphicon-trash"></span></a></td>

		</tr>

		<%
			}
		%>
	
	</table>
	
</body>
</html>