<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import ="conexion.Conexion"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Principal</title>
<link rel="stylesheet" href="css/principal.css">
</head>
<body>
    <%
        Statement st=null;
        Connection cn = null;
        ResultSet rs = null;
    %>
    <div class="contenedor">
        <p><b>CONSULTA DE VENTAS</b></p>
        <p>Folio venta:</p> 
        
        <form>
            <input type="number" min="0" name="txtbuscar" >
            <input type="submit" value="CONSULTAR">
        </form>
        <br>
        <a href="principal.jsp"> VER TODAS LAS VENTAS</a>
        <br>
        <%
            String nombuscar=request.getParameter("txtbuscar");
            if(nombuscar!=null){
                cn = Conexion.getConexion();
                st = cn.createStatement();
                rs=st.executeQuery("SELECT * FROM productos where idproductos LIKE '%"+nombuscar+"%'");
                while(rs.next()){
        %>
            <form  method="get">
                <table border="1" >
                    <thead>
                        <tr>
                            <th>
                                No.
                            </th>
                             <th>
                                Producto
                            </th>
                             <th>
                                Cantidad
                            </th>
                             <th>
                                Precio unitario
                            </th>
                             <th>
                                Total
                            </th>
                        </tr>
                    </thead>
                    <tbody>   
                        <tr>
                            <th scope="row">
                                <%=rs.getString(1)%>
                            </th>
                            <td>
                                <%= rs.getString(2)%>
                            </td>
                            <td>
                                <%= rs.getString(3)%>
                            </td>
                            <td>
                                <%= rs.getString(4)%>
                            </td>
                            <td>
                                <%= rs.getString(5)%>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <div class="total">   
                <div class="blok">
                    Total de productos:
                    <%
                       try
                       {
                        cn = Conexion.getConexion();
                        st = cn.createStatement();
                        rs = st.executeQuery("SELECT (cantidad) FROM productos WHERE idproductos="+nombuscar+";");   
                        while(rs.next())
                        {
                    %>
                    <input class="totalPV" value="<%=rs.getString(1)%>" disabled="">
                    <%
                        }
                       }catch(Exception e){
                           out.print("error"+e);
                       }
                    %>
                </div>

                <div class="blok">
                    Total venta:
                    <%
                       try
                       {
                        cn = Conexion.getConexion();
                        st = cn.createStatement();
                        rs = st.executeQuery("SELECT (total) FROM productos WHERE idproductos="+nombuscar+";");   
                        while(rs.next())
                        {
                    %>
                    <input class="totalPV" value="<%=rs.getString(1)%>" disabled="">
                    <%
                        }
                       }catch(Exception e){
                           out.print("error"+e);
                       }
                    %>
                </div>
            </div>
        <%
                }
            }else{
                System.err.print("error");
            }
        %>
    </div>
    
</body>
</html>