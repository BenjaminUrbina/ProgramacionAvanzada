/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author benjaminurbinarusque
 */
public class funciones_backend {
    
    // Generar un hash del archivo
    public String generarHash(byte[] archivoBytes) {
    try {
        // Crear un objeto MessageDigest para SHA-256
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        // Generar el hash a partir de los bytes del archivo
        byte[] hash = digest.digest(archivoBytes);
        // Convertir el hash en una representación hexadecimal
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            hexString.append(String.format("%02x", b));
        }
        // Retornar el hash como cadena
        return hexString.toString();
    } catch (NoSuchAlgorithmException e) {
        throw new RuntimeException("Error al generar el hash SHA-256: " + e.getMessage(), e);
    }
}

    // Verificar si el hash del documento ya existe
    public boolean existeHashDocumento(String hash) throws SQLException {
        String query = "SELECT COUNT(*) FROM documento WHERE Hash_document = ?";
        try (Connection connection = conectionBD.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, hash);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        }
        return false;
    }

    // Obtener el PK del superuser
    public int obtenerSuperUserPK() throws SQLException {
        String query = "SELECT ID FROM superuser LIMIT 1";
        try (Connection connection = conectionBD.getInstance().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            if (resultSet.next()) {
                return resultSet.getInt("ID");
            }
        }
        return -1;
    }

    // Obtener el PK del profesor
    public int obtenerProfesorPK(String nombreProfesor) throws SQLException {
        String query = "SELECT ID FROM profesor WHERE Profesor = ?";
        try (Connection connection = conectionBD.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, nombreProfesor);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("ID");
            }
        }
        return -1;
    }

    // Insertar un nuevo profesor
    public int insertarProfesor(String nombreProfesor, String asignatura) throws SQLException {
        String query = "INSERT INTO profesor (Profesor, Asignatura) VALUES (?, ?) RETURNING ID";
        try (Connection connection = conectionBD.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, nombreProfesor);
            preparedStatement.setString(2, asignatura);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("ID");
            }
        }
        return -1;
    }

    // Insertar un nuevo documento
    public void insertarDocumento(String hash, String ubicacion, int year, int semestre, String estado, String nombreArchivo, int superuserId) throws SQLException {
        String query = "INSERT INTO documento (Hash_document, Ubicacion_archivo, year, Semestre, Estado, Nombre_Archivo, Superuser_ID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = conectionBD.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, hash);
            preparedStatement.setString(2, ubicacion);
            preparedStatement.setInt(3, year);
            preparedStatement.setInt(4, semestre);
            preparedStatement.setString(5, estado);
            preparedStatement.setString(6, nombreArchivo);
            preparedStatement.setInt(7, superuserId);
            preparedStatement.executeUpdate();
        }
    }

    // Insertar en la tabla pertenece
    public void insertarPertenece(String documentoId, int profesorId) throws SQLException {
        String query = "INSERT INTO pertenece (Documento_ID, Profesor_ID) VALUES (?, ?)";
        try (Connection connection = conectionBD.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, documentoId);
            preparedStatement.setInt(2, profesorId);
            preparedStatement.executeUpdate();
        }
    }
    
}
   