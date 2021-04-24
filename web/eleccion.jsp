<%-- 
    Document   : eleccion
    Created on : 13-04-2021, 0:01:02
    Author     : Santo Tomás
--%>

<%@page import="model.Privilegio"%>
<%@page import="dao.Dao_privilegio"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <%

            Usuario u = (Usuario) session.getAttribute("user");

            if (u == null) {
                response.sendRedirect("Error.jsp");
            } else {

                Dao_privilegio pv = new Dao_privilegio();
                Privilegio p = pv.getPrivilegio(u.getPrivilegio());

                out.println("Privilegio: " + p.getDescripcion());

            }
        %>
        <h1>Bienvenido señor/a: <%= u.getNombre()%></h1>
        <hr>
        <br>
        <a href="cerrarSesion.do">Cerrar Sesion</a>
        <hr>
        
        <a href="menu.jsp">Ver mis flujos</a>
        <a href="#">Crear nuevo flujo</a>
    </body>
</html>
