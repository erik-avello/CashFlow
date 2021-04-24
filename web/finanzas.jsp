<%-- 
    Document   : index
    Created on : 29-mar-2021, 16:56:19
    Author     : Erik
--%>

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
                            <th>uno</th>
                            <th>dos</th>
                            <th>tres</th>
                            <th>cuatro</th>
                            <th>cinco</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
                <div class="">
                    <button type="button" class="btn btn-success" onclick="agregarFila()">Agregar fila</button>
                    <button type="button" class="btn btn-danger" onclick="eliminarFila()">Eliminar fila</button>
                    <button type="button" class="btn btn-success" onclick="agregarColumna()">Agregar columna</button>
                    <button type="button" class="btn btn-danger" onclick="eliminarColumna()">Eliminar columna</button>
                </div>
            </div>
        </div>
    </body>
</html>

<script type="text/javascript">
    function agregarFila(){
        var row = document.getElementById("columnaTabla");
        var nColumnas = $("#tablaFinanzas tr:first th").length;
        
        // document.getElementById("tablaFinanzas").insertRow(-1).innerHTML = '<td><input type="text" readonly="true" class="form-control"></td>\n\
        //                                                                    <td><input type="text" readonly="true" class="form-control"></td>\n\
        //                                                                    <td><input type="text" readonly="true" class="form-control"></td>\n\
        //                                                                    <td><input type="text" readonly="true" class="form-control"></td>\n\
        //
        //                                                                                                                                        <td><input type="text" readonly="true" class="form-control"></td>';
        
        var texto = "";
        var texto2 = '<td><input type="text" readonly="true" class="form-control"></td>';
        for(var i=0; i<nColumnas; i++){
            texto = texto + texto2;
        }      
        
        document.getElementById("tablaFinanzas").insertRow(-1).innerHTML = texto;
    }
    
    function eliminarFila(){
        var table = document.getElementById("tablaFinanzas");
        var rowCount = table.rows.length;

        if(rowCount <= 1)
          alert('No es posible eliminar más filas');
        else
          table.deleteRow(rowCount -1);
    }
    
    function agregarColumna(colCount){ 
        var table = document.getElementById("tablaFinanzas");
        //var rowCount = table.rows.length;
        //for(var i=0; i<rowCount; i++){            
        //    var row = table.rows[i];
        //    row.insertCell(colCount);   
        //}
        
        var tr = document.getElementById('tablaFinanzas').tHead.children[0],
        th = document.createElement('th');
        th.innerHTML = "";
        tr.appendChild(th);
        
    }
    
    function eliminarColumna(){
        var row = document.getElementById("columnaTabla");
        var nColumnas = $("#tablaFinanzas tr:first th").length;
        if( nColumnas > 5 )
            row.deleteCell(-1);
        else
            alert("No es posible eliminar más columnas");
    }
    
    $(document).on('dblclick', 'input', function() {
        $(this).prop('readonly', false);
    });
    
    

</script>
