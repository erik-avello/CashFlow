package controlador;

import dao.DAO_Accion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            String array [] = request.getParameterValues("datos");
            
            System.out.println("idFlujo: "+idFlujo);
            System.out.println("idTipo: "+idTipo);
            for (int i = 0; i < array.length; i++) {
                System.out.println(array[i]);
            }
            for(String elemento : array){
                System.out.println("elemento array: "+elemento);
            }
            /*try {
            //int idAccion = new DAO_Accion().insertAccion(accion, idFlujo , idTipo);
            //idAccion se retorna
            } catch (Exception ex) {
            Logger.getLogger(registroServlet.class.getName()).log(Level.SEVERE, null, ex);
            }*/
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
