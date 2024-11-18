<%-- Document : pruebas Created on : 22-09-2024, 8:47:13 p. m. Author : benjaminurbinarusque --%>

<%@page import="java.util.List"%>
<%@page import="com.pruebasuls.prograavanzada.serverlets.ResultadosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./styles/formulario.css">
    <title>PruebULS - Pruebas</title>
</head>

<body>
    <%@include file="navbar.jsp"%>

    <div class="container formulario">
        <form action="SvBusqueda" method="POST">
            <div class="form-group">
                <label for="nombre" class="form-label">Nombre del Archivo</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="form-group">
                <label for="profesor" class="form-label">Nombre del Profesor</label>
                <input type="text" class="form-control" id="profesor" name="profesor" required>
            </div>
            <div class="form-group">
                <label for="Asignatura" class="form-label">Asignatura</label>
                <input type="text" class="form-control" id="asignatura" name="asignatura" required>
            </div>
            <div class="form-group">
                <label for="ano" class="form-label">Año</label>
                <select class="form-control" id="ano" name="ano" required>
                <option value="" disabled selected>Seleccione el año</option>
                </select>
            </div>
            <div class="form-group">
                <label for="semestre" class="form-label">Semestre</label>
                <select class="form-control" id="semestre" name="semestre" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary mt-2">Consultar</button>
        </form>
    </div>
    <div class = "Result">
        <%
            List<ResultadosBD> resultados = (List<ResultadosBD>) request.getAttribute("resultados");
            if (resultados != null) { // Solo muestra la tabla si 'resultados' no es null
        %>
            <h1>Resultados de Búsqueda</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Profesor</th>
                        <th>Asignatura</th>
                        <th>Año</th>
                        <th>Semestre</th>
                        <th>Nombre del Archivo</th>
                        <th>Descarga</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (resultados != null && !resultados.isEmpty()) {
                            System.out.println("ENTRANDO A MOSTRAR RESULTADOS");
                            for (ResultadosBD resultado : resultados) {
                    %>
                                <tr>
                                    <td><%= resultado.getProfesor() %></td>
                                    <td><%= resultado.getAsignatura() %></td>
                                    <td><%= resultado.getYear() %></td>
                                    <td><%= resultado.getSemestre() %></td>
                                    <td><%= resultado.getNombreArchivo() %></td>
                                    <<td>
                                        <a href="data:application/pdf;base64,<%= 
                                                java.util.Base64.getEncoder().encodeToString(resultado.getDocumento()) %>
                                        "download="<%= resultado.getNombreArchivo().replaceAll("\\s+", "_") + "_" + resultado.getProfesor().replaceAll("\\s+", "_") + ".pdf" %>" class="btn btn-primary">
                                         Descargar PDF
                                        </a>
                                    </td>
                                </tr>
                    <%
                            }
                        } else { System.out.println("ENTRANDO a No resultados");
                    %>
                            <tr>
                                <td colspan="5">No se encontraron resultados.</td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            }
        %>

        </div>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/aporte.js"></script>
</body>

</html>