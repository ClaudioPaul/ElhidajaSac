/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Claudio Cruzado
 */
public class ApiReniecSunat {
    private String dni;
    private String nombres;
    private String apellidos;
    private String ruc;
    private String rasonsocial;
    private String direccion;

    public ApiReniecSunat() {
    }

    public ApiReniecSunat(String dni, String nombres, String apellidos, String ruc, String rasonsocial, String direccion) {
        this.dni = dni;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.ruc = ruc;
        this.rasonsocial = rasonsocial;
        this.direccion = direccion;
    }

    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getRasonsocial() {
        return rasonsocial;
    }

    public void setRasonsocial(String rasonsocial) {
        this.rasonsocial = rasonsocial;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    
    
}
