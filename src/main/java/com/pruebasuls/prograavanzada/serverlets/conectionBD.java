package com.pruebasuls.prograavanzada.serverlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class conectionBD {
    private static final String URL = "jdbc:postgresql://localhost:5432/prograav";
    private static final String USER = "postgres";
    private static final String PASSWORD = "20buc0";
    
    private static conectionBD instance;
    private Connection connection;


    private conectionBD() throws SQLException {
        try {
            // Cargar el controlador JDBC
            Class.forName("org.postgresql.Driver");
            // Establecer la conexión
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión a la base de datos establecida.");
        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el controlador JDBC de PostgreSQL.");
            throw new SQLException("No se encontró el controlador JDBC.", e);
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos.");
            throw e;
        }
    }

    // Método para obtener la instancia única de la clase
    public static conectionBD getInstance() throws SQLException {
        if (instance == null || instance.connection.isClosed()) {
            instance = new conectionBD();
        }
        System.out.println("Retornando Instancia");
        return instance;
    }

    // Método para obtener la conexión a la base de datos
    public Connection getConnection() {
        return connection;
    }

    // Método para cerrar la conexión
    public static void closeConnection() {
        if (instance != null && instance.connection != null) {
            try {
                instance.connection.close();
                System.out.println("Conexión a la base de datos cerrada.");
            } catch (SQLException e) {
                System.err.println("Error al cerrar la conexión.");
            } finally {
                instance = null; // Resetear la instancia
            }
        }
    }
}
