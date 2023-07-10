/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Autos;
import Modelo.Empleados;
import Modelo.Marca;
import Modelo.Modelo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class AutosDao {
    Conexion conexion;
    
    public AutosDao(){
        conexion = new Conexion();
    }
    
    public boolean Registrar(Autos autos) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarAutos(?,?,?,?,?)}");
            cs.setString(1, autos.getMatricula());
            cs.setInt(2, autos.getIdMarca());
            cs.setInt(3, autos.getIdModelo());
            cs.setString(4, autos.getGeneracion());
            cs.setInt(5, autos.getIdEmpresa());

            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Autos> listar() {
        ArrayList<Autos> listaAutos =new ArrayList();
        Autos autos;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call mostrarAutos}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                autos = new Autos();
                autos.setId(rs.getInt(1));
                autos.setMatricula(rs.getString(2));
                autos.setMarca(rs.getString(3));
                autos.setModelo(rs.getString(4));
                autos.setGeneracion(rs.getString(5));
                autos.setEmpresa(rs.getString(6));
                listaAutos.add(autos);
            }
        } catch (Exception e) {
            
        }
        return listaAutos;
    }
    
    public List<Marca> listarMarca(){
        ArrayList<Marca> listaMarca = new ArrayList();
        Marca marca;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarMarca}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                marca = new Marca();
                marca.setId(rs.getInt(1));
                marca.setMarca(rs.getString(2));
                listaMarca.add(marca);
            }
        } catch (Exception e) {
            
        }
        return listaMarca;
    }
    
    public List<Modelo> listarModelo(){
        ArrayList<Modelo> listaModelo = new ArrayList();
        Modelo modelo;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarModelo}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                modelo = new Modelo();
                modelo.setId(rs.getInt(1));
                modelo.setModelo(rs.getString(2));
                listaModelo.add(modelo);
            }
        } catch (Exception e) {
            
        }
        return listaModelo;
    }
    
    public Autos Seleccionar(int IdAutos) {
        Autos autos = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call SeleccionarAutos(?)}");
            cs.setInt(1, IdAutos);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                autos = new Autos();
                autos.setId(rs.getInt(1));
                autos.setMatricula(rs.getString(2));
                autos.setIdMarca(rs.getInt(3));
                autos.setMarca(rs.getString(4));
                autos.setIdModelo(rs.getInt(5));
                autos.setModelo(rs.getString(6));
                autos.setGeneracion(rs.getString(7));
                autos.setIdEmpresa(rs.getInt(8));
                autos.setEmpresa(rs.getString(9));
            }
        } catch (Exception e) {
        }
        return autos;
    }
    
    public boolean Eliminar(int IdAuto) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EliminarAutos(?)}");
            cs.setInt(1, IdAuto);
            cs.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean Editar(Autos autos) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EditarAutos(?,?,?,?,?,?)}");
            cs.setString(1, autos.getMatricula());
            cs.setInt(2, autos.getIdMarca());
            cs.setInt(3, autos.getIdModelo());
            cs.setString(4, autos.getGeneracion());
            cs.setInt(5, autos.getIdEmpresa());
            cs.setInt(6, autos.getId());
            
            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Autos> Buscar(String Matricula) {
         ArrayList<Autos> listaAutos =new ArrayList();
        Autos autos;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call BuscarAutos(?)}");
            cs.setString(1, Matricula);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                autos = new Autos();
                autos.setId(rs.getInt(1));
                autos.setMatricula(rs.getString(2));
                autos.setMarca(rs.getString(3));
                autos.setModelo(rs.getString(4));
                autos.setGeneracion(rs.getString(5));
                autos.setEmpresa(rs.getString(6));
                listaAutos.add(autos);
            }
            
        } catch (Exception e) {
            
        }
        return listaAutos;
    }
}
