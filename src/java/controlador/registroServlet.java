package controlador;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.internal.util.xml.impl.ReaderUTF8;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.DAO_Mes;
import dao.DAO_RegistroTabla;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.GuardarDatos;
import model.Mes;
import model.MesDato;

/**
 *
 * @author ANON
 */
@WebServlet(name = "registroServlet", urlPatterns = {"/registroAccion.do"})
public class registroServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String accion = request.getParameter("accion");
            int idFlujo = Integer.parseInt(request.getParameter("idFlujo"));
            System.out.println("-------------------");
            System.out.println(idFlujo);
            System.out.println("-------------------");
            int idTipo = Integer.parseInt(request.getParameter("idTipo"));
            System.out.println("-------------------");
            System.out.println(idTipo);
            System.out.println("-------------------");
            String loqueviene = request.getParameter("datos");

            try {

                int mesInicial = Integer.parseInt(request.getParameter("idPrimermes"));
                int contMes = 0;

                System.out.println("-----------------------------");
                System.out.println("-----------------------------");
                System.out.println(mesInicial);
                System.out.println("-----------------------------");
                System.out.println("-----------------------------");

                JsonArray array = convertirJSONArray(loqueviene);

                List<GuardarDatos> lista = new ArrayList<>();

                for (int i = 1; i < array.size(); i++) {
                    System.out.println("siguiente objeto");
                    //reinicio del contador para el idmes
                    contMes = mesInicial;

                    //se rescata el jsonobject de la lista
                    JsonObject jsonObject = (JsonObject) array.get(i);
                    System.out.println(jsonObject);
                    System.out.println("-------------------------------------------");

                    for (int j = 1; j < jsonObject.size(); j++) {
                        //nombre accion puede ser ya sea sueldo/bono/hierba/etc
                        String nombreAccion = new Gson().toJson(jsonObject.get("Ingresos"));
                        String nombreAccionReplace = nombreAccion.replaceAll("^[\"']+|[\"']+$", "");
                        System.out.println(nombreAccion);

                        //aqui vamos rescatando los meses por el id;
                        //el id esta sacado por un contador el cual se reinicia al id inicial cada vez que se pasa
                        //a un uevo objeto json
                        Mes mes = new DAO_Mes().getMesPorId(contMes);
                        System.out.println(mes.getNombre());

                        //aqui rescatamos el dato que pertenece al mes
                        //y ademas pertenece a la accion antes rescatada
                        //es decir, el siguiente dato de la lista
                        String dato = new Gson().toJson(jsonObject.get(mes.getNombre()));
                        
                        String result = dato.replaceAll("^[\"']+|[\"']+$", "");
                        
                        System.out.println(result);
                        
                        
                        
                        //ej de insert
                        //null, nombreAccion, mes.getid, dato
                        new DAO_RegistroTabla().insertRegistros(String.valueOf(idFlujo), String.valueOf(idTipo), nombreAccionReplace, mes.getId(), result);
                        contMes++;
                    }

                }

            } catch (ClassNotFoundException | SQLException ex) {
                System.out.println("se cayo!!!!   "+ex.getLocalizedMessage());
            }

            /*try {
            //int idAccion = new DAO_Accion().insertAccion(accion, idFlujo , idTipo);
            //idAccion se retorna
            } catch (Exception ex) {
            Logger.getLogger(registroServlet.class.getName()).log(Level.SEVERE, null, ex);
            }*/
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private JsonArray convertirJSONArray(String listaEnString) throws IOException {
        JsonParser parser = new JsonParser();

        Object obj = parser.parse(listaEnString);
        JsonArray array = (JsonArray) obj;
        System.out.println("djshakdj----" + array);
        return array;
    }

}
