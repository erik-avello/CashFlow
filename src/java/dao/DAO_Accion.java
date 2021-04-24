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
import model.Accion;
import model.Conexion;

/**
 *
 * @author JOAQUIN
 */
public class DAO_Accion extends Conexion implements DAO<Accion>{
    
    public DAO_Accion() throws ClassNotFoundException, SQLException{
        super("bd_practica");
    }
    
    public int insertAccion(String descripcion, int id_flujo_fk, int id_tipo_fk) throws SQLException{
        ejecutar("INSERT INTO ACCION VALUES(NULL, '"+descripcion+"','"+id_flujo_fk+"','"+id_tipo_fk+"');");
        
        return getmaxid();
    }
    
    public int getmaxid() throws SQLException{
        ResultSet rs = ejecutar("SELECT MAX(id) FROM ACCION;");
        int id = -1;
        if(rs.next()){
            id = rs.getInt(1);
        }
        
        return id;
        
    }

    @Override
    public void create(Accion ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public List<Accion> read() throws Exception {
        ResultSet rs = ejecutar("SELECT * FROM ACCION;");
        List<Accion> lista = new ArrayList<>();
        Accion a = null;
        
        if(rs.next()){
            a = new Accion();
            a.setId(rs.getInt(1));
            a.setDescripcion(rs.getString(2));
            a.setId_flujo_fk(rs.getInt(3));
            a.setId_tipo_fk(rs.getInt(4));
            lista.add(a);
        }
        return lista;
    }

    @Override
    public void update(Accion object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
