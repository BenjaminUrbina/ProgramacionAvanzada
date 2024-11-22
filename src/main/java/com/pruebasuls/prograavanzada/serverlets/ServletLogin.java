package com.pruebasuls.prograavanzada.serverlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "ServletLogin", urlPatterns = {"/SvLogin"})
public class ServletLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Obtener la conexión a la base de datos
            Connection conn = conectionBD.getInstance().getConnection();

            // Preparar consulta SQL
            String sql = "SELECT * FROM superuser WHERE nombre = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            // Ejecutar consulta
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Credenciales válidas
                HttpSession session = request.getSession();
                session.setAttribute("user", username); // Guardar el usuario en la sesión
                session.setAttribute("isAdmin", true); // Indicar que el usuario es admin

                response.sendRedirect("index.jsp"); // Redirigir al sitio principal
            } else {
                // Credenciales inválidas
                request.setAttribute("error", "Usuario o contraseña incorrectos.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al conectar con la base de datos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

