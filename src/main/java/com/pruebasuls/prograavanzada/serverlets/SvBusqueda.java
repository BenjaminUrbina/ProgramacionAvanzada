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
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author benjaminurbinarusque
 */
@WebServlet(name = "SvBusqueda", urlPatterns = {"/SvBusqueda"})
@MultipartConfig
public class SvBusqueda extends HttpServlet {
    protected funciones_backend_Busqueda funcionesBackend = new funciones_backend_Busqueda();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            response.setContentType("text/html;charset=UTF-8");
            String nombreArchivo = request.getParameter("nombre");
            System.out.println(nombreArchivo);
            String nombreProfesor = request.getParameter("profesor");
            System.out.println(nombreProfesor);
            String asignatura = request.getParameter("asignatura");
            
            System.out.println(asignatura);
            int ano = Integer.parseInt(request.getParameter("ano"));
            
            System.out.println(ano);
            int semestre = Integer.parseInt(request.getParameter("semestre"));

            System.out.println("------- BUSQUEDAPRINCIPAL");
            List<ResultadosBD> resultados = funcionesBackend.BusquedaPrincipal(nombreProfesor, nombreArchivo, asignatura, ano, semestre);
            System.out.println("Resultados enviados al JSP:");
            request.setAttribute("resultados", resultados);
            request.getRequestDispatcher("pruebas_search.jsp").forward(request, response);
            
            
        } catch (ServletException | IOException | NumberFormatException | SQLException e) {
            response.getWriter().println("Error durante el procesamiento: " + e.getMessage());
        }

        
        
        

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
