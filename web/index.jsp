<%-- 
    Document   : index
    Created on : 01-04-2021, 1:08:09
    Author     : rivaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <form action="Validate.do" method="post">
            <input type="text" name="rut" placeholder="Rut: ">
            <input type="password" name="pass" placeholder="Pass: ">
            <input type="submit" name="btniniciar" value="Iniciar Sesion ">
            
        </form>
    </body>
</html>
