package controlador;

import com.google.gson.Gson;
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
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import dao.DAO_Mes;
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
 * @author JOAQUIN
 */
@WebServlet(name = "registroServlet", urlPatterns = {"/registroAccion.do"})
public class registroServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String accion = request.getParameter("accion");
            int idFlujo = Integer.parseInt(request.getParameter("idFlujo"));
            int idTipo = Integer.parseInt(request.getParameter("idTipo"));
            String loqueviene = request.getParameter("datos");

            try {

                int mesInicial = Integer.parseInt(request.getParameter("idPrimermes"));
                int contMes = 0;
                Mes mes = new DAO_Mes().getMesPorId(mesInicial);

                System.out.println("-----------------------------");
                System.out.println("-----------------------------");
                System.out.println(mesInicial);
                System.out.println("-----------------------------");
                System.out.println("-----------------------------");

                JsonArray array = convertirJSONArray(loqueviene);

                List<GuardarDatos> lista = new ArrayList<>();

                for (int i = 1; i < array.size(); i++) {
                    System.out.println("siguiente objeto");
                    contMes = mesInicial;
                    JsonObject jsonObject = (JsonObject) array.get(i);
                    System.out.println(jsonObject);
                    System.out.println("-------------------------------------------");

                    for (int j = 1; j < jsonObject.size(); j++) {
                        System.out.println(jsonObject.get("Ingresos"));
                        System.out.println(new DAO_Mes().getMesPorId(contMes).getNombre());
                        System.out.println(jsonObject.get(new DAO_Mes().getMesPorId(contMes).getNombre()));
                        contMes++;
                    }

                }

            } catch (ClassNotFoundException | SQLException ex) {
                System.out.println("se cayo!!!!");
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
