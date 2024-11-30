
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
        String profesor = request.getParameter("profesor");
        String documento = request.getParameter("documento");

        // Crear el JSON para enviar la consulta a Prolog
        String jsonInputString = String.format("{\"operacion\": \"consulta\", \"profesor\": \"%s\", \"documento\": \"%s\"}",
                                                profesor, documento);

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

        // Enviar la respuesta al cliente (navegador)
        response.setContentType("application/json");
        response.getWriter().write(responseString);
    }
}
