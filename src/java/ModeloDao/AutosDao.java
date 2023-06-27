/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Autos;
import Modelo.Empleados;
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
    
    public boolean Registrar(Empleados empleado) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarEmpleados(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, empleado.getNombres());
            cs.setString(2, empleado.getApellidos());
            cs.setInt(3, empleado.getIdTipoEmpleado());
            cs.setInt(4, empleado.getIdEmpresaTerciaria());
            cs.setString(5, empleado.getTipoDocumento());
            cs.setString(6, empleado.getNumeroDocumento());
            cs.setString(7, empleado.getTelefono());
            cs.setString(8, empleado.getCorreo());
            cs.setString(9, empleado.getDireccion());
            cs.setString(10, empleado.getTipoLicencia());
            cs.setString(11, empleado.getNumeroLicencia());

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
    
    public Empleados Seleccionar(int IdEmpleados) {
        Empleados empleados = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call SeleccionarEmpleados(?)}");
            cs.setInt(1, IdEmpleados);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                empleados = new Empleados();
                empleados.setId(rs.getInt(1));
                empleados.setNombres(rs.getString(2));
                empleados.setApellidos(rs.getString(3));
                empleados.setIdTipoEmpleado(rs.getInt(4));
                empleados.setTipoEmpleado(rs.getString(5));
                empleados.setIdEmpresaTerciaria(rs.getInt(6));
                empleados.setEmpresaTercearia(rs.getString(7));
                empleados.setNumeroDocumento(rs.getString(8));
                empleados.setTelefono(rs.getString(9));
                empleados.setCorreo(rs.getString(10));
                empleados.setDireccion(rs.getString(11));
                empleados.setTipoDocumento(rs.getString(12));
            }
        } catch (Exception e) {
        }
        return empleados;
    }
    
    public boolean Eliminar(int IdEmpleado) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EliminarEmpleados(?)}");
            cs.setInt(1, IdEmpleado);
            cs.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean Editar(Empleados empleados) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EditarEmpleados(?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, empleados.getNombres());
            cs.setString(2, empleados.getApellidos());
            cs.setInt(3, empleados.getIdTipoEmpleado());
            cs.setInt(4, empleados.getIdEmpresaTerciaria());
            cs.setString(5, empleados.getTipoDocumento());
            cs.setString(6, empleados.getNumeroDocumento());
            cs.setString(7, empleados.getTelefono());
            cs.setString(8, empleados.getCorreo());
            cs.setString(9, empleados.getDireccion());
            cs.setString(10, empleados.getTipoLicencia());
            cs.setString(11, empleados.getNumeroLicencia());
            cs.setInt(12, empleados.getId());
            
            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
}
