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
public class Compras {
    private int Id;
    private int IdProveedores;
    private int Proveedores;
    private String Fecha;
    private String Serie;
    private int Correlativo;
    private Double Total;
    private byte[] Archivo;

    public Compras(int Id, int IdProveedores, int Proveedores, String Fecha, String Serie, int Correlativo, Double Total, byte[] Archivo) {
        this.Id = Id;
        this.IdProveedores = IdProveedores;
        this.Proveedores = Proveedores;
        this.Fecha = Fecha;
        this.Serie = Serie;
        this.Correlativo = Correlativo;
        this.Total = Total;
        this.Archivo = Archivo;
    }

    public Compras() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getIdProveedores() {
        return IdProveedores;
    }

    public void setIdProveedores(int IdProveedores) {
        this.IdProveedores = IdProveedores;
    }

    public int getProveedores() {
        return Proveedores;
    }

    public void setProveedores(int Proveedores) {
        this.Proveedores = Proveedores;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getSerie() {
        return Serie;
    }

    public void setSerie(String Serie) {
        this.Serie = Serie;
    }

    public int getCorrelativo() {
        return Correlativo;
    }

    public void setCorrelativo(int Correlativo) {
        this.Correlativo = Correlativo;
    }

    public Double getTotal() {
        return Total;
    }

    public void setTotal(Double Total) {
        this.Total = Total;
    }

    public byte[] getArchivo() {
        return Archivo;
    }

    public void setArchivo(byte[] Archivo) {
        this.Archivo = Archivo;
    }

    
    
}
