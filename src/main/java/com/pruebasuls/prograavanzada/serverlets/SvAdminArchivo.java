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
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 *
 * @author matia
 */
@WebServlet(name = "SvAdminArchivo", urlPatterns = {"/SvAdminArchivo"})
public class SvAdminArchivo extends HttpServlet {

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
        String hashDocumento = request.getParameter("hashDocumento");
        String nuevoEstado = request.getParameter("nuevoEstado");
        String nombre = request.getParameter("nombre");
        String profesor = request.getParameter("profesor");

        System.out.println("Hash del Documento: " + hashDocumento);
        System.out.println("Nuevo Estado: " + nuevoEstado);
        System.out.println("Nombre del Documento: " + nombre);
        System.out.println("Profesor: " + profesor);

        funciones_adminArchivo funciones = new funciones_adminArchivo();
        try {
            // Cambiar el estado del documento en la base de datos
            funciones.cambiarEstadoDocumentoPorHash(hashDocumento, nuevoEstado);

            // Si el nuevo estado es "Aprobado", enviar la relación a Prolog
            if ("Aprobado".equals(nuevoEstado)) {
                // Enviar la información a Prolog directamente
                enviarRelacionProlog(profesor, nombre);
            }

            // Redirigir a `doGet` para actualizar la tabla
            response.sendRedirect("SvAdminArchivo");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al cambiar el estado: " + e.getMessage());
        }
    }

    private void enviarRelacionProlog(String profesor, String documento) {
        try {
            // URL del servidor Prolog
            URL url = new URL("http://localhost:4000/query");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Construir el JSON para enviar a Prolog
            String jsonInputString = String.format(
                    "{\"operacion\": \"crear\", \"profesor\": \"%s\", \"documento\": \"%s\"}",
                    profesor.replace("\"", "\\\""), documento.replace("\"", "\\\"")
            );

            // Depuración: imprimir el JSON que se enviará
            System.out.println("JSON enviado a Prolog: " + jsonInputString);

            // Enviar el JSON en el cuerpo de la solicitud
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Obtener el código de respuesta
            int responseCode = connection.getResponseCode();
            System.out.println("Código de respuesta de Prolog: " + responseCode);

            // Leer la respuesta del servidor
            try (BufferedReader br = new BufferedReader(
                    new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                System.out.println("Respuesta de Prolog: " + response.toString());
            }
        } catch (Exception e) {
            System.err.println("Error al conectar con Prolog: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
