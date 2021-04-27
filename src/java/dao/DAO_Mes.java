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
import model.Mes;

/**
 *
 * @author JOAQUIN
 */
public class DAO_Mes extends Conexion implements DAO<Mes>{

    public DAO_Mes() throws ClassNotFoundException, SQLException {
        super("bd_practica");
    }
    
    public Mes getMesPorId(int id) throws SQLException{
        ResultSet rs = ejecutar("SELECT * FROM MES WHERE id='"+id+"';");
        Mes m = null;
        
        if(rs.next()){
            m = new Mes();
            m.setId(rs.getInt(1));
            m.setNombre(rs.getString(2));
            
        }
        return m;
    }

    @Override
    public void create(Mes ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override

    public List<Mes> read() throws Exception {
        ResultSet rs = ejecutar("SELECT * FROM MES;");
        Mes m = null;
        List<Mes> lista = new ArrayList<>();
        
        while(rs.next()){
            m = new Mes();
            m.setId(rs.getInt(1));
            m.setNombre(rs.getString(2));
            lista.add(m);
        }
        return lista;
    }

    @Override
    public void update(Mes object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
