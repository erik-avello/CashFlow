package dao;

import java.sql.SQLException;
import model.Conexion;

/**
 *
 * @author JOAQUIN
 */
public class DAO_RegistroTabla extends Conexion{
    
    public DAO_RegistroTabla() throws ClassNotFoundException, SQLException {
        super("bd_practica");
    }
    
    
    public void insertRegistros(String idFlujo, String idTipo, String accion, int idMes, String dato) throws SQLException{
        ejecutar("INSERT INTO registroDatosFlujo VALUES(NULL, '"+idFlujo+"','"+idTipo+"','"+accion+"','"+idMes+"','"+dato+"');");
        close();
    }
    
}
