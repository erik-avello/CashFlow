<%-- 
    Document   : menu
    Created on : 03-04-2021, 0:26:40
    Author     : rivaa
--%>

<%@page import="model.Flujo"%>
<%@page import="dao.DAO_Flujo"%>
<%@page import="java.util.List"%>
<%@page import="dao.DAO_Mes"%>
<%@page import="model.Mes"%>
<%@page import="dao.Dao_privilegio"%>
<%@page import="model.Privilegio"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //SESIÓN USUARIO
    Usuario u = (Usuario) session.getAttribute("user");

    DAO_Mes dao_mes = new DAO_Mes();
    DAO_Flujo dao_flujo = new DAO_Flujo();

    List<Mes> lista = dao_mes.read();
    List<Flujo> listaFlujo = dao_flujo.getFlujoUsuario(u.getId());

    //int idFlujoRequest = Integer.parseInt(request.getParameter("idFlujo"));
    //Flujo flujo = dao_flujo.getFlujo(idFlujoRequest);
    int idFlujo = 1;

    int mesInicial = -1;
    int acumulador = 1;
    try {
        if (request.getParameter("mesInicial") != null) {
            mesInicial = Integer.parseInt(request.getParameter("mesInicial"));
        } else {
            mesInicial = -1;
        }
    } catch (Exception ex) {
        mesInicial = -1;
    }
%>

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
                            <th>Ingresos</th>
                                <%if (mesInicial != -1) {%>
                            <th><%= lista.get(mesInicial - 1).getNombre()%></th>
                            <th><%= lista.get(mesInicial).getNombre()%></th>
                            <th><%= lista.get(mesInicial + 1).getNombre()%></th>  
                                <%}%>
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
            <br>
            <hr>
            <button type="button" class="btn btn-success" id="guardarCambios" onclick="guardarCambios()">Guardar avance</button> 
        </div>

        <div>
            <%
                if (mesInicial == -1) {%>
            <form action="menu.jsp" method="POST">
                <input type="number" name="mesInicial" placeholder="INGRESE MES A INICIAR SISTEMA">
                <input type="submit" value="INICIAR">
            </form>
            <%} else {%>
            <h1>INICIO FLUJO</h1>
            <%}
            %>
        </div>

        <h1>Menu Principal</h1>
        <%
            if (u == null) {
                response.sendRedirect("Error.jsp");
            } else {

                out.println("Bienvenido señor/a " + u.getNombre());
                out.println("<hr>");
                Dao_privilegio pv = new Dao_privilegio();
                Privilegio p = pv.getPrivilegio(u.getPrivilegio());

                out.println("Privilegio: " + p.getDescripcion());

            }
        %>
        <br>
        <a href="cerrarSesion.do">Cerrar Sesion</a>

    </body>


    <script type="text/javascript">

        function agregarFila() {
            var row = document.getElementById("columnaTabla");
            var nColumnas = $("#tablaFinanzas tr:first th").length;
            var texto = "";
            var texto2 = '<td class="td"><input type="text" readonly="true" class="form-control"></td>';
            for (var i = 0; i < nColumnas; i++) {
                texto = texto + texto2;
            }

            document.getElementById("tablaFinanzas").insertRow(-1).innerHTML = texto;
        }

        function eliminarFila() {
            var table = document.getElementById("tablaFinanzas");
            var rowCount = table.rows.length;
            if (rowCount <= 1)
                alert('No es posible eliminar más filas');
            else
                table.deleteRow(rowCount - 1);
        }


        var acumulador = 0;
        function agregarColumna(colCount) {
            acumulador = acumulador + 1;
            var idMes = <%= lista.get(mesInicial + acumulador).getId()%>;
            var nombreMes = "nada";
            var idMes = idMes + acumulador;
            console.log(idMes);
            switch (idMes) {
                case 1:
                    nombreMes = "Enero";
                    idMes = 1;
                    break;
                case 2:
                    nombreMes = "Febrero";
                    idMes = 2;
                    break;
                case 3:
                    nombreMes = "Marzo";
                    idMes = 3;
                    break;
                case 4:
                    nombreMes = "Abril";
                    idMes = 4;
                    break;
                case 5:
                    nombreMes = "Mayo";
                    idMes = 5;
                    break;
                case 6:
                    nombreMes = "Junio";
                    idMes = 6;
                    break;
                case 7:
                    nombreMes = "Julio";
                    idMes = 7;
                    break;
                case 8:
                    nombreMes = "Agosto";
                    idMes = 8;
                    break;
                case 9:
                    nombreMes = "Septiembre";
                    idMes = 9;
                    break;
                case 10:
                    nombreMes = "Octubre";
                    idMes = 10;
                    break;
                case 11:
                    nombreMes = "Noviembre";
                    idMes = 11;
                    break;
                case 12:
                    nombreMes = "Diciembre";
                    idMes = 12;
                    acumulador = 0;
                    break;
            }

            var table = document.getElementById("tablaFinanzas");
            var filas = table.rows.length;
            var tr = document.getElementById('tablaFinanzas').tHead.children[0],
                    th = document.createElement('th');
            th.innerHTML = "" + nombreMes;
            tr.appendChild(th);
            $('#tablaFinanzas').find('tr').each(function () {
                var columna = $(this);
                if (columna.index() === 0) {
                } else {
                    columna.append('<td><input type="text" readonly="true" class="form-control"></td>');
                }
            })
        }

        function eliminarColumna() {
            var table = document.getElementById("tablaFinanzas");
            //var nColumnas = $("#tablaFinanzas tr:first th").length;
            var nColumnas = $("#tablaFinanzas tr:last td").length;
            var nFilas = $("#tablaFinanzas tr").length;
            console.log("numero de columnas");
            console.log(nColumnas);
            if (nColumnas > 1) {
                for (var i = 0; i < nFilas; i++) {
                    console.log("valor de la i");
                    console.log(i);
                    var firstRow = document.getElementById("tablaFinanzas").rows[i];
                    console.log("la que se esta boorando");
                    console.log(nColumnas - 1);
                    firstRow.deleteCell(nColumnas - 1);
                }

            }


        }

        function guardarCambios() {
            var listaTH = new Array();
            var listaAccion = new Array();
            var listaValoresTd = new Array();

            var accion = "";
            var valores = "";
            var contCol = 0;
            var contFil = 0;
            var nColumnasPARACONTADOR = $("#tablaFinanzas tr:last td").length;
            var nFilasTabla = $("#tablaFinanzas tr").length;


            $('#tablaFinanzas tr:first th').each(function () {
                var value = $(this).text();
                listaTH.push(value);
            });

            /*$("#tablaFinanzas tr").find('td:eq(0)').each(function () {
             var value = $(this).find('input[type="text"]').val();
             listaAccion.push(value);
             }); */

            
        /*$("#tablaFinanzas tr td").each(function (i) {
                var value = $(this).find('input[type="text"]').val();
                listaValoresTd.push(value);
            });*/



            /*
             var resume_table = document.getElementById("tablaFinanzas");
             
             for (var i = 1, row ; row = resume_table.rows[i] ; i++) {
             
             for (var j = 1, col; col = row.cells[j] ; j++) {
             
             console.log("Texto: "+col.innerText);
             console.log("Fila: "+i);
             console.log("Columna: "+j);
             }
             }
             
             
             /*
             $('#tablaFinanzas tr').each(function (i) {
             //valores = $(this).find('input[type="text"]').val();
             valores = listaValoresTd[contFil];
             accion = listaAccion[contFil];
             var valorListaTH = listaTH[contCol];
             
             console.log("Valor TH: " + valorListaTH);
             console.log("Accion: " + accion);
             console.log("valor: "+ valores);
             
             if (accion !== undefined) {
             
             } else {
             
             }
             
             if (valorListaTH !== undefined) {
             
             } else {
             
             }
             
             if (contCol === nColumnasPARACONTADOR) {
             contCol = 0;
             }
             if (contFil === nFilasTabla){
             contFil = 0;
             }
             
             contCol++;
             contFil++;
             });
             */


            var valores = "";

            
            $("#tablaFinanzas").parent("tr").find("td").each(function (i) {
                if(i === nColumnasPARACONTADOR){
                        i = 0;
                }
        
                if (i > 0) {
                    valores = $(this).find('input[type="text"]').val();
                } else {
                    valores = "";
                }
                
                console.log("Contador ktm: "+i);
                console.log("valores: "+valores);
                
                i++;
                
                
            });



            /*
            $('#tablaFinanzas tr td').each(function (i) {

                if (i > 0) {
                    valores = $(this).find('input[type="text"]').val();
                    alert(valores);
                } else {
                    valores = "";
                }


                var accion = $(this).find('input[type="text"]').eq(0).val();
                listaAccion.push(accion);

                //var accion = listaAccion[contFil];
                var valorListaTH = listaTH[contCol];

                var nombreTipo;
                nombreTipo = listaTH[0];
                //funcion que retorna el iddeltipo a traves del nombre

                var idTipo = "";
                if (nombreTipo === "Ingresos") {
                    idTipo = 1;
                } else {
                    if (nombreTipo === "Egresos") {
                        idTipo = 2;
                    }

                }

                //insert con este dato $(this).find('.cell:first-child').text();
                //var idAccion = select maxid;
                //var idAccion;

                $.ajax({
                 data: {
                 accion: accion,
                 idFlujo: <%= idFlujo%>,
                 idTipo: idTipo
                 },
                 url: "registroAccion.do",
                 type: 'POST',
                 success: function (response) {
                 console.log("Respuesta Ajax: " + response);
                 var respuesta = (response);
                 }
                 }); 

                if (contCol === nColumnasPARACONTADOR) {
                    contCol = 0;
                }

                contCol++;
                contFil++;
            }); */

        }


        $(document).on('click', 'input', function () {
            $(this).prop('readonly', false);
        });

        var idMes = data.getmes(table.getelementbyid("thmes1"));
        var nFilas2 = table.rows.length;
        var nColumna2 = $("#tablaFinanzas tr:last td").length;
        for (var f = 0; f < nFilas2; f++) {
            var idAccion = 0;
            for (var c = 0; c < nColumna2; c++) {
                if (c == 0) {
                    // var campoaccion1 = table.values(f,c);
                    // insert into accion(null, ifflujo, campoaccion1);
                    // idAccion = select max(id) from accion;
                } else {
                    //insert into tablaintermedia(null,idflujo,idaccion, idmes,var campoaccion1 = table.values(f,c));
                }

            }
        }
    </script>

</html>
