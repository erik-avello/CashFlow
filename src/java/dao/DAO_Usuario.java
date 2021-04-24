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
import model.Usuario;

/**
 *
 * @author rivaa
 */
public class DAO_Usuario extends Conexion implements DAO<Usuario>{
    
    public Usuario getUsuario(String rut,String pass) throws SQLException{
        
       ResultSet rs = ejecutar("select * from usuario where rut = '" +rut+ "' and clave = '" +pass+"';");
       Usuario u = null;
        if(rs.next()){
            u = new Usuario();
            
            u.setId(rs.getInt(1));
            u.setRut(rs.getString(2));
            u.setNombre(rs.getString(3));
           // u.setClave(rs.getString(4));
            u.setPrivilegio(rs.getInt(5));
            
            
        }
        
        return u;
    }

    public DAO_Usuario() throws ClassNotFoundException, SQLException {
        super("bd_practica");
    }

    @Override
    public void create(Usuario ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Usuario> read() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Usuario object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
