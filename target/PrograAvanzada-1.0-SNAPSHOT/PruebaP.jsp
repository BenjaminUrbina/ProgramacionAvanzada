<%-- 
    Document   : PruebaP
    Created on : 28-11-2024, 4:38:38 p. m.
    Author     : benjaminurbinarusque
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 <body>
    <h1>Consulta a Prolog</h1>
    <input type="text" id="pregunta" placeholder="Escribe tu pregunta aquí">
    <button onclick="enviarPregunta()">Enviar</button>
    <div id="respuesta"></div>
    
    <script>
        function enviarPregunta() {
            const pregunta = document.getElementById('pregunta').value;
            const url = `http://localhost:4000/query?pregunta=${encodeURIComponent(pregunta)}`;
            alert(url);

            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error en la red');
                    }
                    return response.json();
                })
                .then(data => {
                    document.getElementById('respuesta').innerText = 'Respuesta: ' + data.respuesta;
                })
                .catch(error => {
                    document.getElementById('respuesta').innerText = 'Error: ' + error.message;
                });
        }
    </script>
</body>

</html>
