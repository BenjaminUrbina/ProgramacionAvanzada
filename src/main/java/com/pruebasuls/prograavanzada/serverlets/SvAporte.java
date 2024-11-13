/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author benjaminurbinarusque
 */
@WebServlet(name = "SvAporte", urlPatterns = {"/SvAporte"})
public class SvAporte extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            // Intentamos obtener la conexión
            connection = conectionBD.getInstance().getConnection();
            System.out.println("Conexión exitosa a la base de datos.");

            // Crear y ejecutar la consulta SQL
            String query = "SELECT * FROM superuser";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            // Procesar y mostrar los resultados de la consulta
            System.out.println("Resultados de la tabla superuser:");
            while (resultSet.next()) {
                // Reemplaza "columna1", "columna2", etc., con los nombres de las columnas de tu tabla superuser
                int id = resultSet.getInt("id"); // Ejemplo: suponiendo que tienes una columna "id"
                String nombre = resultSet.getString("nombre_usuario"); // Suponiendo que tienes una columna "nombre"
                String password = resultSet.getString("password"); // Suponiendo que tienes una columna "email"

                // Imprimir los valores de las columnas
                System.out.println("ID: " + id + ", Nombre: " + nombre + ", password: " + password);
            }

        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos o al ejecutar la consulta: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Cerrar los recursos
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}