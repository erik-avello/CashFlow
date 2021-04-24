/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Conexion;
import model.Privilegio;

/**
 *
 * @author rivaa
 */
public class Dao_privilegio extends Conexion implements DAO<Privilegio>{

    public Dao_privilegio() throws ClassNotFoundException, SQLException {
        super("bd_practica");
    }
    public Privilegio getPrivilegio(int id) throws SQLException{
       ResultSet rs = ejecutar("select * from privilegio where id ="+id);
       Privilegio p = null;
        if(rs.next()){
            p = new Privilegio();
            
            p.setId(rs.getInt(1));
            p.setDescripcion(rs.getString(2));
          
            
            
        }
        
        return p;
    }

    @Override
    public void create(Privilegio ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Privilegio> read() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Privilegio object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
    
}
