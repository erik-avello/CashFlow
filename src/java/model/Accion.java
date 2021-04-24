/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author JOAQUIN
 */
public class Accion {
    int id;
    String descripcion;
    int id_flujo_fk;
    int id_tipo_fk;

    public Accion(){
        
    }
    
    public Accion(int id, String descripcion, int id_flujo_fk, int id_tipo_fk){
        this.id = id;
        this.descripcion = descripcion;
        this.id_flujo_fk = id_flujo_fk;
        this.id_tipo_fk = id_tipo_fk;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_flujo_fk() {
        return id_flujo_fk;
    }

    public void setId_flujo_fk(int id_flujo_fk) {
        this.id_flujo_fk = id_flujo_fk;
    }

    public int getId_tipo_fk() {
        return id_tipo_fk;
    }

    public void setId_tipo_fk(int id_tipo_fk) {
        this.id_tipo_fk = id_tipo_fk;
    }
    
    
}
