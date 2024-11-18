/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author benjaminurbinarusque
 */
public class funciones_backend_Busqueda {

    
   protected void BusquedaPrincipal(String profesor, String nombre, String asignatura, int year, int semestre) throws SQLException {
        // Consulta SQL con condiciones en WHERE
        String query = "SELECT p.profesor, p.asignatura, d.year, d.semestre, d.nombre_archivo " +
                       "FROM profesor p, documento d " +
                       "WHERE p.profesor = ? " +  // Relación entre Profesor y Documento
                       "AND p.asignatura = ? " +        // Condición para la asignatura
                       "AND d.year = ? " +             // Condición para el año
                       "AND d.semestre = ? " +         // Condición para el semestre
                       "AND d.nombre_archivo = ? "+
                       "AND d.estado = 'pendiente'";     // Condición para el nombre del archivo

        // Uso de try-with-resources para manejar recursos
        try (Connection connection = conectionBD.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // valores a reemplazar en ?
            preparedStatement.setString(1, profesor);
            preparedStatement.setString(2, asignatura);
            preparedStatement.setInt(3, year);
            preparedStatement.setInt(4, semestre);
            preparedStatement.setString(5, nombre);

            // Ejecución de la consulta
            ResultSet resultSet = preparedStatement.executeQuery();

            // Procesamiento de los resultados
            while (resultSet.next()) {
                String profesorResultado = resultSet.getString("Profesor");
                String asignaturaResultado = resultSet.getString("Asignatura");
                int yearResultado = resultSet.getInt("year");
                int semestreResultado = resultSet.getInt("Semestre");
                String nombreArchivoResultado = resultSet.getString("Nombre_Archivo");
                

                // Mostrar los resultados por consola
                System.out.println("Profesor: " + profesorResultado);
                System.out.println("Asignatura: " + asignaturaResultado);
                System.out.println("Año: " + yearResultado);
                System.out.println("Semestre: " + semestreResultado);
                System.out.println("Nombre del Archivo: " + nombreArchivoResultado);
                System.out.println("-------------------------------------------------");
                
                //Llamar a funcion para poder mostrar en JSP la informacion rescatada
                
            }
        } catch (SQLException e) {
            System.out.println("Error al realizar la consulta. Parámetros:");
            System.out.println("Profesor: " + profesor);
            System.out.println("Asignatura: " + asignatura);
            System.out.println("Año: " + year);
            System.out.println("Semestre: " + semestre);
            System.out.println("Nombre del Archivo: " + nombre);
            throw new SQLException("Error en la consulta: " + query, e);
        }

   }
   
}
