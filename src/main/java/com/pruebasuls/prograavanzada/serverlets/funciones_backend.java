/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author benjaminurbinarusque
 */
public class funciones_backend {
    
    
    
    
    protected void obtenerSuperUser(){
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
                String nombre = resultSet.getString("nombre_usuario"); // Suponiendo que tienes una columna "nombre_usuario"
                String password = resultSet.getString("password"); // Suponiendo que tienes una columna "password"

                // Imprimir los valores de las columnas
                System.out.println("ID: " + id + ", Nombre: " + nombre + ", Password: " + password);
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
    
}
   