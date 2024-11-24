package com.pruebasuls.prograavanzada.serverlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ServletLogout", urlPatterns = {"/SvLogout"})
public class ServletLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la sesión y destruirla
        HttpSession session = request.getSession(false); // Usamos false para no crear una nueva sesión si no existe
        if (session != null) {
            session.invalidate(); // Invalida la sesión
        }

        // Redirigir a la página principal (index.jsp)
        response.sendRedirect("index.jsp");
    }
}
