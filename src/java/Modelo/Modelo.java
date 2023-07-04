/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author EDWIN S.Y
 */
public class Modelo {
    private int Id;
    private String Modelo;

    public Modelo() {
    }

    public Modelo(int Id, String Modelo) {
        this.Id = Id;
        this.Modelo = Modelo;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }
    
    
}
