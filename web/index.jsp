<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio de Sesión</title>
<link rel="stylesheet" href="css/principal.css">
</head>
<body>
     <div class="padre">
         <form action="usuario" method="post" class="hijo">
            <table class="">
                <tr>
                    <td>
                        LOGIN
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td><input type="text" name="nombre" /></td>
                </tr>
                <tr>
                    <td>Contraseña:</td>
                    <td><input type="password" name="clave" /></td>
                </tr>
                <tr>
                    <td colspan="3" class="cent"><input type="submit" value="INGRESAR"/></td>
                </tr>
            </table>
            <div>
                <p>
                    <%
                        String resultado = (String)request.getAttribute("mensaje");
                        String mensaje = "";
                        if (resultado != null) {
                            mensaje = resultado;
                        }
                    %>
                    <%=mensaje %>
                </p>
            </div>
	</form>
     </div>
</body>
</html>

