package com.pruebasuls.prograavanzada.serverlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.stream.Collectors;

@WebServlet("/ConsultaPrologServlet")
public class ConsultaPrologServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        // Obtener los parámetros del formulario
        System.out.println("Entre al serverlet!!!!");
        String profesor = request.getParameter("profesor");
        String documento = request.getParameter("documento");

        // Crear el JSON para enviar la consulta a Prolog
        // Crear el JSON para enviar la consulta a Prolog
        String jsonInputString = String.format(
                "{\"operacion\": \"consulta\", \"profesor\": \"%s\", \"documento\": \"%s\"}",
                profesor.replace("\"", "\\\""),
                documento.replace("\"", "\\\"")
        );
        // Configurar la conexión al servidor Prolog
        URL url = new URL("http://localhost:4000/query"); // Cambia el puerto si es necesario
        HttpURLConnection http = (HttpURLConnection) url.openConnection();
        http.setRequestMethod("POST");
        http.setRequestProperty("Content-Type", "application/json; utf-8");
        http.setRequestProperty("Accept", "application/json");
        http.setDoOutput(true);

        // Enviar la solicitud JSON al servidor Prolog
        try (OutputStream os = http.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // Leer la respuesta del servidor Prolog
        String responseString;
        try (BufferedReader br = new BufferedReader(
                new java.io.InputStreamReader(http.getInputStream(), "utf-8"))) {
            responseString = br.lines().collect(Collectors.joining(System.lineSeparator()));
        }

        String jsonResponse = responseString.substring(responseString.indexOf("{"), responseString.lastIndexOf("}") + 1);
        String respuesta = jsonResponse.contains("Existe") ? "okey" : "nosale";
        
        System.out.println("Respuesta serverlet "+jsonResponse);
        System.out.println("Respuesta prolog "+responseString);
        System.out.println("Comparacion: "+respuesta);
        
        request.setAttribute("mensaje", respuesta);
        request.getRequestDispatcher("pruebas_search.jsp").forward(request, response);
    }
}
