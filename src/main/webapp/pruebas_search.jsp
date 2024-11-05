<%-- Document : pruebas Created on : 22-09-2024, 8:47:13 p. m. Author : benjaminurbinarusque --%>

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
        <form action="">
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
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>