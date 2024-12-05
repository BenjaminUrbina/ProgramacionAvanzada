<%@page import="java.util.List"%>
<%@page import="com.pruebasuls.prograavanzada.serverlets.ResultadosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PruebULS - Pruebas</title>
        <link rel="icon" href="images/logopruebasin.png">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="styles/formulario.css">
        <title>PruebULS - Inicio</title>
    </head>

    <body>
        <!-- Navbar -->
        <%@include file="navbar.jsp"%>

        <div class="container py-5">
            <!-- Formulario de Búsqueda -->
            <div class="card shadow-lg p-3 mb-5 bg-body-tertiary rounded">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0">Buscar Pruebas</h3>
                </div>
                <div class="card-body">
                    <form action="SvBusqueda" method="POST">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del Archivo</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre del archivo" required>
                        </div>
                        <div class="mb-3">
                            <label for="profesor" class="form-label">Nombre del Profesor</label>
                            <input type="text" class="form-control" id="profesor" name="profesor" placeholder="Ingrese el nombre del profesor" required>
                        </div>
                        <div class="mb-3">
                            <label for="asignatura" class="form-label">Asignatura</label>
                            <input type="text" class="form-control" id="asignatura" name="asignatura" placeholder="Ingrese la asignatura" required>
                        </div>
                        <div class="mb-3">
                            <label for="ano" class="form-label">Año</label>
                            <select class="form-select" id="ano" name="ano" required>
                                <option value="" disabled selected>Seleccione el año</option>
                                <!-- Opciones dinámicas pueden generarse desde el backend -->
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="semestre" class="form-label">Semestre</label>
                            <select class="form-select" id="semestre" name="semestre" required>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Consultar</button>
                    </form>
                </div>

            </div>
            <div class="card shadow-lg p-3 mb-5 bg-body-tertiary rounded">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0">Buscar Pruebas Rapido Prolog</h3>
                </div>
                <div class="card-body">
                    <form action="ConsultaPrologServlet" method="POST">
                        <label class="form-label" for="profesor">Nombre del Profesor:</label><br>
                        <input class="form-control" type="text" id="profesor" name="profesor" placeholder="Ingrese el nombre del profesor" required><br><br>
                        <label class="form-label" for="documento">Nombre del Documento:</label><br>
                        <input class="form-control" name="documento" type="text" id="documento" placeholder="Ingrese el nombre del archivo" required><br><br>
                        <button class="btn btn-primary w-100" type="submit">Consultar</button>
                    </form>
                </div>
            </div>
            <script>
                function cerrarPopup() {
                    document.getElementById('popup').style.display = 'none';
                }
            </script>
            <%    String mensaje = (String) request.getAttribute("mensaje");
                if (mensaje != null) {
                    if (mensaje.equals("okey")) {
            %>
            <div id="popup" class="popup-overlay" style="display: flex;">
                <div class="popup-content">
                    <h1 class="Prueba">Nustra base de datos encontro los elementos buscados, para descargarlos busquelo en el formulario de arriaba.</h1>
                    <button onclick="cerrarPopup()">Cerrar</button>
                </div>
            </div>
            <%
            } else {
            %>
            <div id="popup" class="popup-overlay" style="display: flex;">
                <div class="popup-content">
                    <h1>Nustra base de datos NO encontro los elementos buscados, porfavor busca otros o prueba una busqueda mas especifica en el formulario superiror</h1>
                    <button onclick="cerrarPopup()">Cerrar</button>
                </div>
            </div>
            <%
                    }
                }
            %>

            <%                List<ResultadosBD> resultados = (List<ResultadosBD>) request.getAttribute("resultados");
                if (resultados != null && !resultados.isEmpty()) {
            %>

            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">
                    <h3 class="card-title mb-0">Resultados de Búsqueda</h3>
                </div>
                <div class="table-responsive">
                    <div class="card-body p-0">
                        <table class="table table-hover table-striped mb-0">
                            <thead class="table-dark">
                                <tr>
                                    <th>Profesor</th>
                                    <th>Asignatura</th>
                                    <th>Año</th>
                                    <th>Semestre</th>
                                    <th>Nombre del Archivo</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (ResultadosBD resultado : resultados) {%>
                                <tr>
                                    <td><%= resultado.getProfesor()%></td>
                                    <td><%= resultado.getAsignatura()%></td>
                                    <td><%= resultado.getYear()%></td>
                                    <td><%= resultado.getSemestre()%></td>
                                    <td><%= resultado.getNombreArchivo()%></td>
                                    <td>
                                        <a href="data:application/pdf;base64,<%=java.util.Base64.getEncoder().encodeToString(resultado.getDocumento())%>"
                                           download="<%= resultado.getNombreArchivo().replaceAll("\\s+", "_") + "_" + resultado.getProfesor().replaceAll("\\s+", "_") + ".pdf"%>"
                                           class="btn btn-sm btn-outline-primary">
                                            Descargar
                                        </a>
                                        <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalPrevisualizar<%= resultado.getNombreArchivo()%>">
                                            Previsualizar
                                        </button>
                                        <div class="modal fade" id="modalPrevisualizar<%= resultado.getNombreArchivo()%>" tabindex="-1" aria-labelledby="modalPrevisualizarLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-xl">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="modalPrevisualizarLabel">Previsualización de: <%= resultado.getNombreArchivo()%></h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <!-- Previsualización del archivo PDF -->
                                                        <iframe src="data:application/pdf;base64,<%= java.util.Base64.getEncoder().encodeToString(resultado.getDocumento())%>"
                                                                width="100%" height="700px" frameborder="0"></iframe>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <% } else if (resultados != null && resultados.isEmpty()) { %>
            <div class="alert alert-info text-center mt-4">
                <p>No se encontraron resultados. Intente con otros criterios de búsqueda.</p>
            </div>
            <% }%>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom JS -->
        <script src="js/aporte.js"></script>
    </body>

</html>