/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Erik
 */
public class registroDatosFlujo {
    int id;
    int idFlujo;
    int idTipo;
    String accion;
    int idMes;
    String dato;

    public registroDatosFlujo(){
        
    }
    
    public registroDatosFlujo(int id, int idFlujo, int idTipo, String accion, int idMes, String dato){
        this.id = id;
        this.idFlujo = idFlujo;
        this.idTipo = idTipo;
        this.accion = accion;
        this.idMes = idMes;
        this.dato = dato;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdFlujo() {
        return idFlujo;
    }

    public void setIdFlujo(int idFlujo) {
        this.idFlujo = idFlujo;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public int getIdMes() {
        return idMes;
    }

    public void setIdMes(int idMes) {
        this.idMes = idMes;
    }

    public String getDato() {
        return dato;
    }

    public void setDato(String dato) {
        this.dato = dato;
    }
    
}
