/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conectionBD {
    public static void main(String[] args) {
        // URL de conexión
        String url = "jdbc:postgresql://localhost:5432/prograav"; //cambiar el puerto y nombre segun su configuracion
        String user = "postgres"; // Cambia por tu usuario de PostgreSQL
        String password = "contra"; // Cambia por tu contraseña de postgresql

        // Establecer la conexión
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            if (connection != null) {
                System.out.println("Conexión exitosa a la base de datos");
            } else {
                System.out.println("Fallo en la conexión a la base de datos");
            }
        } catch (SQLException e) {
            System.out.println("Error en la conexión: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

