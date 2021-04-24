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
public class Mes {
    int Id;
    String Nombre;

    public Mes(){
        
    }
    
    public Mes(int Id, String Nombre){
        this.Id = Id;
        this.Nombre = Nombre;
    }
    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
}
