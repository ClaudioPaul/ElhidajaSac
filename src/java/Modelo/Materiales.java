/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author EDWIN S.Y
 */
public class Materiales {
    private int Id;
    private String Nombre;
    private String Descripcion;
    private Double precio;
    private int Stock;

    public Materiales() {
    }

    public Materiales(int Id, String Nombre, String Descripcion, Double precio, int Stock) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.precio = precio;
        this.Stock = Stock;
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

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }
    
    
}
