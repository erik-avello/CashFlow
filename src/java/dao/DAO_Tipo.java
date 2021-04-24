/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Conexion;
import model.Tipo;

/**
 *
 * @author JOAQUIN
 */
public class DAO_Tipo extends Conexion implements DAO<Tipo>{

    public DAO_Tipo() throws ClassNotFoundException, SQLException{
        super("bd_practica");
    }
    
    
    
    public List<Tipo> getTipo() throws SQLException{
        ResultSet rs = ejecutar("SELECT * FROM TIPO;");
        List<Tipo> lista = new ArrayList<>();
        Tipo t = null;
        
        if(rs.next()){
            t = new Tipo();
            t.setId(rs.getInt(1));
            t.setNombre(rs.getString(2));
            lista.add(t);
        }
        return lista;
    }
    
    @Override
    public void create(Tipo ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Tipo> read() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Tipo object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
