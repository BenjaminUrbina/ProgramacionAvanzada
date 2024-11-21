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
        <link rel="stylesheet" href="./styles/formulario.css">
    </head>

    <body>
        <!-- Navbar -->
        <%@include file="navbar.jsp"%>

        <div class="container py-5">
            <!-- Formulario de Búsqueda -->
            <div class="card shadow-sm mb-4">
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

            <!-- Resultados de Búsqueda -->
            <%
                List<ResultadosBD> resultados = (List<ResultadosBD>) request.getAttribute("resultados");
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
                                        <button type="button" class="btn btn-sm btn-outline-secondary">Previsualizar</button>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <% } else if(resultados != null && resultados.isEmpty()) { %>
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
