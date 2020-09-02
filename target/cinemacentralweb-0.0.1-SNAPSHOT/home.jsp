<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Home</title>

<style type="text/css">
#navegador ul{
   list-style-type: none;
   text-align: center;
}
#navegador li{
   display: inline;
   text-align: center;
   margin: 0 10px 0 0;
}
#navegador li a {
   padding: 2px 7px 2px 7px;
   color: #666;
   background-color: #eeeeee;
   border: 1px solid #ccc;
   text-decoration: none;
}
#navegador li a:hover{
   background-color: #333333;
   color: #ffffff;
}
   </style>
</head>

<body>
	<p style="text-align: right" >Bienvenid@ <%=session.getAttribute("nombre")%></p>

<div id="navegador">
<ul>
<li><a href="#">Elemento 1</a></li>
<li><a href="#">Elemento 2</a></li>
<li><a href="#">Elemento 3</a></li>
<li><a href="#">Elemento 4</a></li>
</ul>
</div>

</body>
</html>