/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author matia
 */
public class funciones_adminArchivo {
    // Método para obtener la lista de documentos con sus datos
    public List<Map<String, String>> obtenerDocumentos() throws SQLException {
        List<Map<String, String>> documentos = new ArrayList<>();
        String query = "SELECT d.Hash_document, d.Nombre_Archivo, d.year, d.Semestre, p.Profesor, p.Asignatura, d.Estado " +
                       "FROM documento d " +
                       "JOIN pertenece pe ON d.Hash_document = pe.Documento_ID " +
                       "JOIN profesor p ON pe.Profesor_ID = p.ID " +
                       "WHERE d.Estado = 'pendiente'";

        try (Connection connection = conectionBD.getInstance().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                 System.out.println("Documento encontrado: " + resultSet.getString("Nombre_Archivo")); // Mensaje para cada fila
                Map<String, String> documento = new HashMap<>();
                documento.put("hash", resultSet.getString("Hash_document")); // Incluir el hash
                documento.put("nombre", resultSet.getString("Nombre_Archivo"));
                documento.put("curso", resultSet.getString("Asignatura"));
                documento.put("ano", resultSet.getString("year"));
                documento.put("semestre", resultSet.getString("Semestre"));
                documento.put("profesor", resultSet.getString("Profesor"));
                documento.put("estado", resultSet.getString("Estado"));
                documentos.add(documento);
            }
        }
        System.out.println("Número de documentos encontrados: " + documentos.size()); // Mensaje de depuración
        return documentos;
    }

    // Método para cambiar el estado de un documento usando el hash
    public void cambiarEstadoDocumentoPorHash(String hashDocumento, String nuevoEstado) throws SQLException {
        String query;
        if ("Denegado".equalsIgnoreCase(nuevoEstado)) {
            try (Connection connection = conectionBD.getInstance().getConnection()) {
                // Eliminar filas relacionadas en la tabla 'pertenece'
                String deleteRelatedQuery = "DELETE FROM pertenece WHERE documento_id = ?";
                try (PreparedStatement deleteRelatedStmt = connection.prepareStatement(deleteRelatedQuery)) {
                    deleteRelatedStmt.setString(1, hashDocumento);
                    deleteRelatedStmt.executeUpdate();
                }

                // Eliminar el documento en la tabla 'documento'
                String deleteDocumentQuery = "DELETE FROM documento WHERE hash_document = ?";
                try (PreparedStatement deleteDocumentStmt = connection.prepareStatement(deleteDocumentQuery)) {
                    deleteDocumentStmt.setString(1, hashDocumento);
                    deleteDocumentStmt.executeUpdate();
                }
            }
        } else {
            // Cambiar el estado si no es "Denegado"
            query = "UPDATE documento SET Estado = ? WHERE Hash_document = ?";
            try (Connection connection = conectionBD.getInstance().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, nuevoEstado);
                preparedStatement.setString(2, hashDocumento);
                preparedStatement.executeUpdate();
            }
        }
    }   
}
