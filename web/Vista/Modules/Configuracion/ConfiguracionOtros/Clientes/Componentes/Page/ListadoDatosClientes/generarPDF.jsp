<%-- 
    Document   : generarPDF
    Created on : 26 jun. 2023, 18:28:10
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="application/pdf" pageEncoding="UTF-8"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.util.List"%>
<%@page import="java.Modelo.Empresas"%> <!-- Reemplaza "tu.paquete" con el paquete donde se encuentre la clase Empresa -->
<%@page import="java.ModeloDao.EmpresasDao"%> <!-- Reemplaza "tu.paquete" con el paquete donde se encuentre el DAO listarempresa -->

<%
    // Crear una instancia del DAO listarempresa
    EmpresasDao empresasDao = new EmpresasDao(); // Asegúrate de que el nombre del DAO sea correcto

    // Obtener la lista de empresas utilizando el método correspondiente del DAO
    List<Empresas> listaEmpresas = empresasDao.listar(); // Asegúrate de que el nombre del método sea correcto

    // Configurar la respuesta para descargar el PDF
    response.setHeader("Content-Disposition", "attachment; filename=lista_clientes.pdf");

    // Crear un nuevo documento PDF
    Document document = new Document();
    OutputStream out = response.getOutputStream();
    PdfWriter.getInstance(document, out);

    // Abrir el documento PDF
    document.open();

    // Agregar los datos de las empresas al documento
    for (Empresa empresa : listaEmpresas) {
        document.add(new Paragraph("Ruc: " + empresa.getRuc()));
        document.add(new Paragraph("Razón Social: " + empresa.getRazonSocial()));
        document.add(new Paragraph("Representante: " + empresa.getNombreRepresentante()));
        document.add(new Paragraph("Dirección: " + empresa.getDireccion()));
        document.add(new Paragraph("Teléfono: " + empresa.getTelefono()));
        document.add(new Paragraph("Correo: " + empresa.getCorreo()));
        document.add(new Paragraph("-----------------------------------------"));
    }

    // Cerrar el documento PDF
    document.close();
%>