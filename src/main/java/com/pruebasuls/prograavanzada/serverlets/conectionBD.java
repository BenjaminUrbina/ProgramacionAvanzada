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

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    
    /*public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

    try {
            // Intentamos obtener la conexión
            connection = getConnection();
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
    }*/
}
