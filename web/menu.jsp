<%-- 
    Document   : menu
    Created on : 03-04-2021, 0:26:40
    Author     : rivaa
--%>

<%@page import="dao.DAO_RegistroTabla"%>
<%@page import="model.registroDatosFlujo"%>
<%@page import="model.Flujo"%>
<%@page import="dao.DAO_Flujo"%>
<%@page import="java.util.List"%>
<%@page import="dao.DAO_Mes"%>
<%@page import="model.Mes"%>
<%@page import="dao.Dao_privilegio"%>
<%@page import="model.Privilegio"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //SESIÓN USUARIO
    Usuario u = (Usuario) session.getAttribute("user");

    DAO_Mes dao_mes = new DAO_Mes();
    DAO_Flujo dao_flujo = new DAO_Flujo();
    DAO_RegistroTabla dao_registro = new DAO_RegistroTabla();

    List<Mes> lista = dao_mes.read();
    List<Flujo> listaFlujo = dao_flujo.getFlujoUsuario(u.getId());

    //int idFlujoRequest = Integer.parseInt(request.getParameter("idFlujo"));
    //Flujo flujo = dao_flujo.getFlujo(idFlujoRequest);
    int idFlujo = 1;

    List<registroDatosFlujo> listaRegistro = dao_registro.getRegistrosIngresoPorId(idFlujo);
    if (listaRegistro.isEmpty()) {
        listaRegistro = null;
    }

    int idTipo = 1;

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
        <% if (listaRegistro != null) { %>

        <div class="container">
            <div class="table-responsive">
                <table class="table table-bordered" id="tablaFinanzas">
                    <thead class="thead-dark">
                        <tr id="columnaTabla">
                            <th>Ingresos</th>
                                <%
                                    String accionRepetidaTitlle = "";
                                    for (int i = 0; i < listaRegistro.size(); i++) {
                                        accionRepetidaTitlle = listaRegistro.get(i).getAccion();
                                        
                                        for (int j = 0; j < listaRegistro.size(); j++) {
                                            if (accionRepetidaTitlle.equals(listaRegistro.get(j).getAccion())) {
                                                out.print("<th>"+dao_mes.getMesPorId(j+1).getNombre()+"</th>");
                                                i++;
                                            }
                                        }
                                        break;
                                    }
                                    
                                    String accion = "";

                                    int accionRepetida = 0;

                                    for (int i = 0; i < listaRegistro.size(); i++) {
                                        accion = listaRegistro.get(i).getAccion();
                                        accionRepetida = 0;
                                        out.println("<tr>");
                                        out.println("<td class=td><input type=text class=form-control value='" + accion + "'></td>");
                                        for (int j = 0; j < listaRegistro.size(); j++) {
                                            if (accion.equals(listaRegistro.get(j).getAccion())) {
                                                out.println("<td class=td><input type=text class=form-control value='" + listaRegistro.get(j).getDato() + "'></td>");
                                                i++;
                                                accionRepetida++;
                                            }
                                        }
                                        out.println("</tr>");
                                    }
                                %>
                        </tr>
                    </thead>
                    <%
                    %>


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

        <% } else {%>

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

        <%}%>

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
                    acumulador = -1;
                    break;
                default :
                    nombreMes = "Enero";
                    idMes = 1;
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
            });

            acumulador = acumulador + 1;
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
            let atributos = [];
            document.querySelectorAll('#tablaFinanzas thead th').forEach(elemento => {
                atributos.push(elemento.innerText);
            });
            let datos = [];
            document.querySelectorAll('#tablaFinanzas thead tr').forEach(fila => {

                let dato = {};
                atributos.forEach(campo => {
                    dato[campo] = '';
                });
                fila.querySelectorAll('td').forEach((elemento, n) => {
                    let input = elemento.querySelector('input');

                    if (input !== null) {
                        dato[atributos[n]] = input.value;
                    } else {
                        dato[atributos[n]] = elemento.innerText;
                    }
                });
                datos.push(dato);
            });


            for (var i = 1; i < datos.length; i++) {
                console.log(datos[i]);
                console.log(atributos[i]);
            }

        <%
            if (mesInicial == -1) {
                mesInicial = 1;
            }
        %>

            $.ajax({
                url: "registroAccion.do",
                method: "POST",
                data: {
                    datos: JSON.stringify(datos),
                    "idTipo": <%= idTipo%>,
                    "idFlujo": <%= idFlujo%>,
                    idPrimermes: <%= mesInicial%>
                }
            }).done(function (response) {

            });

        }

        $(document).on('click', 'input', function () {
            $(this).prop('readonly', false);
        });
    </script>

</html>
