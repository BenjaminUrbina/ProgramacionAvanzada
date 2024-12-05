/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 *
 * @author benjaminurbinarusque
 */
@WebServlet(name = "SvAporte", urlPatterns = {"/SvAporte"})
@MultipartConfig
public class SvAporte extends HttpServlet {

    private funciones_backend_Aporte funcionesBackend = new funciones_backend_Aporte();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("Este es el método GET, actualmente sin lógica activa.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Obtener datos del formulario
            String nombreArchivo = request.getParameter("nombre");
            String nombreProfesor = request.getParameter("profesor");
            String asignatura = request.getParameter("asignatura");
            int ano = Integer.parseInt(request.getParameter("ano"));
            int semestre = Integer.parseInt(request.getParameter("semestre"));

            // Procesar el archivo subido
            Part filePart = request.getPart("archivo");
            byte[] archivoBytes = filePart.getInputStream().readAllBytes();
            String hashArchivo = funcionesBackend.generarHash(archivoBytes);

            // Verificar si el archivo ya existe
            if (funcionesBackend.existeHashDocumento(hashArchivo)) {
                response.getWriter().println("El archivo ya existe en la base de datos.");
                return;
            }

            // Verificar o insertar el profesor
            int profesorId = funcionesBackend.obtenerProfesorPK(nombreProfesor);
            if (profesorId == -1) {
                profesorId = funcionesBackend.insertarProfesor(nombreProfesor, asignatura);
            } else {
                System.out.println("Problemas con profesor");
            }

            // Obtener el superuser ID
            int superuserId = funcionesBackend.obtenerSuperUserPK();

            // Insertar en documento
            funcionesBackend.insertarDocumento(hashArchivo, "ubicacion/archivo", ano, semestre, "pendiente", nombreArchivo, superuserId, archivoBytes);

            // Insertar en pertenece
            funcionesBackend.insertarPertenece(hashArchivo, profesorId);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('Archivo registrado exitosamente.');");
            out.println("window.location.href = 'index.jsp';"); // Ajusta la URL según tu proyecto
            out.println("</script>");
            } catch (ServletException | IOException | NumberFormatException | SQLException e) {
            // Mostrar popup de error y redireccionar
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('Error al registrar el archivo: " + e.getMessage() + "');");
            out.println("window.location.href = 'index.jsp';");
            out.println("</script>");
            }
        }

        @Override
        public String getServletInfo
        
            () {
        return "Servlet para la gestión de archivos y sus relaciones.";
        }

    
}
