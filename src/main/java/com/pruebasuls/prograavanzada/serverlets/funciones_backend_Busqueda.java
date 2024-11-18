/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

import jakarta.enterprise.concurrent.Asynchronous.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 *
 * @author benjaminurbinarusque
 */
public class funciones_backend_Busqueda {

    
    public List<ResultadosBD> BusquedaPrincipal(String profesor, String nombre, String asignatura, int year, int semestre) throws SQLException {
        // Consulta SQL con condiciones en WHERE
        List<ResultadosBD> resultados = new ArrayList<>();
                
        String query = "SELECT p.profesor, p.asignatura, d.year, d.semestre, d.nombre_archivo, d.documento " +
                       "FROM profesor p, documento d " +
                       "WHERE p.profesor = ? " +
                       "AND p.asignatura = ? " +
                       "AND d.year = ? " +
                       "AND d.semestre = ? " +
                       "AND d.nombre_archivo = ? "+
                       "AND d.estado = 'Aprobado'";

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
            while (resultSet.next()) {;
                
                ResultadosBD resultado = new ResultadosBD();  // Constructor público
                resultado.setProfesor(resultSet.getString("profesor"));
                resultado.setAsignatura(resultSet.getString("asignatura"));
                resultado.setYear(resultSet.getInt("year"));
                resultado.setSemestre(resultSet.getInt("semestre"));
                resultado.setNombreArchivo(resultSet.getString("nombre_archivo"));
                resultado.setDocumento(resultSet.getBytes("documento"));
                

                resultados.add(resultado);
                
            }
        } catch (SQLException e) {
            System.out.println("Error al realizar la consulta: " + e.getMessage());
            throw e;
        }
       return resultados;

   }
   
}
