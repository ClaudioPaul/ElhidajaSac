/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class Usuarios {
    private int Id;
    private int IdEmpleado;
    private String Empleado;
    private String Usuario;
    private String Clave;

    public Usuarios() {
    }

    public Usuarios(int Id, int IdEmpleado, String Empleado, String Usuario, String Clave) {
        this.Id = Id;
        this.IdEmpleado = IdEmpleado;
        this.Empleado = Empleado;
        this.Usuario = Usuario;
        this.Clave = Clave;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getIdEmpleado() {
        return IdEmpleado;
    }

    public void setIdEmpleado(int IdEmpleado) {
        this.IdEmpleado = IdEmpleado;
    }

    public String getEmpleado() {
        return Empleado;
    }

    public void setEmpleado(String Empleado) {
        this.Empleado = Empleado;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }
    
    
}
