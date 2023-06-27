/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class Autos {
    private int Id;
    private String Matricula;
    private int IdMarca;
    private String Marca;
    private int IdModelo;
    private String Modelo;
    private String Generacion;
    private int IdEmpresa;
    private String Empresa;

    public Autos() {
    }

    public Autos(int Id, String Matricula, int IdMarca, String Marca, int IdModelo, String Modelo, String Generación, int IdEmpresa, String Empresa) {
        this.Id = Id;
        this.Matricula = Matricula;
        this.IdMarca = IdMarca;
        this.Marca = Marca;
        this.IdModelo = IdModelo;
        this.Modelo = Modelo;
        this.Generacion = Generación;
        this.IdEmpresa = IdEmpresa;
        this.Empresa = Empresa;
    }

    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }

    public int getIdMarca() {
        return IdMarca;
    }

    public void setIdMarca(int IdMarca) {
        this.IdMarca = IdMarca;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public int getIdModelo() {
        return IdModelo;
    }

    public void setIdModelo(int IdModelo) {
        this.IdModelo = IdModelo;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getGeneracion() {
        return Generacion;
    }

    public void setGeneracion(String Generación) {
        this.Generacion = Generación;
    }

    public int getIdEmpresa() {
        return IdEmpresa;
    }

    public void setIdEmpresa(int IdEmpresa) {
        this.IdEmpresa = IdEmpresa;
    }

    public String getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(String Empresa) {
        this.Empresa = Empresa;
    }
    
    
}
