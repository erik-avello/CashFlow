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
import model.Flujo;

/**
 *
 * @author JOAQUIN
 */
public class DAO_Flujo extends Conexion implements DAO<Flujo>{
    
    public DAO_Flujo() throws ClassNotFoundException, SQLException{
        super("bd_practica");
    }
    
    //La idea es obtener los flujos según usuario
    //Ej: usuario que inicia sesión solamente puede revisar sus flujos en un listado
    //Arreglar consulta porque posiblemente está mal
    public List<Flujo> getFlujoUsuario(int idUsuario) throws SQLException{
        ResultSet rs = ejecutar("SELECT * FROM FLUJO WHERE id_usuario_fk = (select id from usuario where id = '"+idUsuario+"');");
        Flujo f = null;
        List<Flujo> lista = new ArrayList<>();
        
        while(rs.next()){
            f = new Flujo();
            f.setId(rs.getInt(1));
            f.setNombre(rs.getString(2));
            f.setFecha(rs.getDate(3));
            f.setId_usuario_fk(rs.getInt(4));
            
            lista.add(f);
        }
        return lista;
    }
    
    public Flujo getFlujo(int id) throws SQLException{
        ResultSet rs = ejecutar("SELECT * FROM FLUJO WHERE id = '"+id+"';");
        Flujo f = null;
        
        if(rs.next()){
            f =  new Flujo();
            f.setId(rs.getInt(1));
            f.setNombre(rs.getString(2));
            f.setFecha(rs.getDate(3));
            f.setId_usuario_fk(rs.getInt(4));
        }
        return f;
    }
    
    @Override
    public void create(Flujo ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Flujo> read() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Flujo object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
