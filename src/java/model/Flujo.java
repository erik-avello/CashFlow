/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author JOAQUIN
 */
public class Flujo {
    int id;
    String nombre;
    Date fecha;
    int id_usuario_fk;

    public Flujo(){
        
    }
    
    public Flujo(int id, String nombre, Date fecha, int id_usuario_fk){
        this.id = id;
        this.nombre = nombre;
        this.fecha = fecha;
        this.id_usuario_fk = id_usuario_fk;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getId_usuario_fk() {
        return id_usuario_fk;
    }

    public void setId_usuario_fk(int id_usuario_fk) {
        this.id_usuario_fk = id_usuario_fk;
    }
    
    
}
