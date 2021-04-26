<%-- 
    Document   : index
    Created on : 29-mar-2021, 16:56:19
    Author     : Erik
--%>

<%@page import="model.Usuario"%>
<%@page import="model.Flujo"%>
<%@page import="java.util.List"%>
<%@page import="dao.DAO_Flujo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Financias</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="Style/Style.css" type="text/css"><link>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="table-responsive">
                <table class="table table-bordered" id="tablaFinanzas">
                    <thead class="thead-dark">
                        <tr id="columnaTabla">
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Fecha</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Usuario u = (Usuario) session.getAttribute("user");
                        System.out.println("Id usuario: "+u.getId());
                        
                        DAO_Flujo dao_flujo = new DAO_Flujo();
                        List<Flujo> lista = dao_flujo.getFlujoUsuario(u.getId());
                        
                        for (Flujo f : lista) {
                                System.out.println("Id: "+f.getId());
                                System.out.println("Nombre: "+f.getNombre());
                            }
                        
                        for (Flujo f : lista) {
                                out.println("<tr>");
                                out.println("<td>"+f.getId()+"</td>");
                                out.println("<td>"+f.getNombre()+"</td>");
                                out.println("<td>"+f.getFecha()+"</td>");
                                out.println("<td><a href='menu.jsp?idFlujo=1'>Interactuar</a></td>");
                                out.println("</tr>");
                            }
                    %>
                    </tbody>
                </table>
                <div class="">
                   
                </div>
            </div>
        </div>
    </body>
</html>
