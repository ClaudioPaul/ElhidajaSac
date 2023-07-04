/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author EDWIN S.Y
 */
public class Proveedores {
    private int Id;
    private String Ruc;
    private String RazonSocial;
    private String NombreRepresentante;
    private String ApellidoRepresentante;
    private String Direccion;
    private String Contacto;

    public Proveedores() {
    }

    
    
    public Proveedores(int Id, String Ruc, String RazonSocial, String NombreRepresentante, String ApellidoRepresentante, String Direccion, String Contacto) {
        this.Id = Id;
        this.Ruc = Ruc;
        this.RazonSocial = RazonSocial;
        this.NombreRepresentante = NombreRepresentante;
        this.ApellidoRepresentante = ApellidoRepresentante;
        this.Direccion = Direccion;
        this.Contacto = Contacto;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getRuc() {
        return Ruc;
    }

    public void setRuc(String Ruc) {
        this.Ruc = Ruc;
    }

    public String getRazonSocial() {
        return RazonSocial;
    }

    public void setRazonSocial(String RazonSocial) {
        this.RazonSocial = RazonSocial;
    }

    public String getNombreRepresentante() {
        return NombreRepresentante;
    }

    public void setNombreRepresentante(String NombreRepresentante) {
        this.NombreRepresentante = NombreRepresentante;
    }

    public String getApellidoRepresentante() {
        return ApellidoRepresentante;
    }

    public void setApellidoRepresentante(String ApellidoRepresentante) {
        this.ApellidoRepresentante = ApellidoRepresentante;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getContacto() {
        return Contacto;
    }

    public void setContacto(String Contacto) {
        this.Contacto = Contacto;
    }
    
    
}
