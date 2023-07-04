/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author EDWIN S.Y
 */
public class DetalleCompra {
    private int Id;
    private int IdMateriales;
    private String Materiales;
    private int IdCompras;
    private String Proveedores;
    private Date fecha;
    private int Catidad;
    private Double Precio;
    private Double Subtotal;
    private Double Total;

    public DetalleCompra() {
    }

    public DetalleCompra(int Id, int IdMateriales, String Materiales, int IdCompras, String Proveedores, Date fecha, int Catidad, Double Precio, Double Subtotal, Double Total) {
        this.Id = Id;
        this.IdMateriales = IdMateriales;
        this.Materiales = Materiales;
        this.IdCompras = IdCompras;
        this.Proveedores = Proveedores;
        this.fecha = fecha;
        this.Catidad = Catidad;
        this.Precio = Precio;
        this.Subtotal = Subtotal;
        this.Total = Total;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getIdMateriales() {
        return IdMateriales;
    }

    public void setIdMateriales(int IdMateriales) {
        this.IdMateriales = IdMateriales;
    }

    public String getMateriales() {
        return Materiales;
    }

    public void setMateriales(String Materiales) {
        this.Materiales = Materiales;
    }

    public int getIdCompras() {
        return IdCompras;
    }

    public void setIdCompras(int IdCompras) {
        this.IdCompras = IdCompras;
    }

    public String getProveedores() {
        return Proveedores;
    }

    public void setProveedores(String Proveedores) {
        this.Proveedores = Proveedores;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getCatidad() {
        return Catidad;
    }

    public void setCatidad(int Catidad) {
        this.Catidad = Catidad;
    }

    public Double getPrecio() {
        return Precio;
    }

    public void setPrecio(Double Precio) {
        this.Precio = Precio;
    }

    public Double getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(Double Subtotal) {
        this.Subtotal = Subtotal;
    }

    public Double getTotal() {
        return Total;
    }

    public void setTotal(Double Total) {
        this.Total = Total;
    }
    
    
}
