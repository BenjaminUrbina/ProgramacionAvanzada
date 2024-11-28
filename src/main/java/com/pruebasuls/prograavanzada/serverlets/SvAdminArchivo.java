/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 *
 * @author matia
 */
@WebServlet(name = "SvAdminArchivo", urlPatterns = {"/SvAdminArchivo"})
public class SvAdminArchivo extends HttpServlet{
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session != null && Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
        funciones_adminArchivo funciones = new funciones_adminArchivo();
        try {
            List<Map<String, String>> documentos = funciones.obtenerDocumentos();
            request.setAttribute("documentos", documentos);
            request.getRequestDispatcher("administrar_archivos.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener los documentos: " + e.getMessage());
        }
    } else {
        response.sendRedirect("login.jsp");
    }
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hashDocumento = request.getParameter("hashDocumento"); // Recuperar el hash del documento
        String nuevoEstado = request.getParameter("nuevoEstado");

        funciones_adminArchivo funciones = new funciones_adminArchivo();
        try {
            // Cambiar el estado del documento en la base de datos
            funciones.cambiarEstadoDocumentoPorHash(hashDocumento, nuevoEstado);
            response.sendRedirect("SvAdminArchivo"); // Redirigir a `doGet` para actualizar la tabla
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al cambiar el estado: " + e.getMessage());
        }
    }
}
