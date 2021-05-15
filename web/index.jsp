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
        <link rel="stylesheet" href="Style/cssIndex.css"

    </head>
    <body>


       
        <form id="form" action="Validate.do" method="post">
            <div class="form">
            <h1>Iniciar Sesion</h1>
            <div class="grupo">
                <input  type="text" name="rut" placeholder="Rut: ">
            
            </div>
                        
            <div class="grupo">
                <input  type="password" name="pass" placeholder="Password: ">
            
                <input  class="button" type="submit" name="btniniciar" value="Iniciar Sesion ">
            
        </form>
    </div
</body>
</html>
