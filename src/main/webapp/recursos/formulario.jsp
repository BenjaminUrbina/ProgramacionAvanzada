<%-- 
    Document   : formulario
    Created on : 14-10-2024, 12:17:25 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container">
            <form action="<%= request.getContextPath() %>/SubirArchivoServlet" method="post" enctype="multipart/form-data">
                <h1 class="text-center form-group">Formulario de Envío</h1>
                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre del Archivo</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="ano" class="form-label">Fecha</label>
                    <input type="date" class="form-control" id="ano" name="ano" required>
                </div>
                <div class="form-group">
                    <label for="semestre" class="form-label">Semestre</label>
                    <select class="form-control" id="semestre" name="semestre" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="profesor" class="form-label">Nombre del Profesor</label>
                    <input type="text" class="form-control" id="profesor" name="profesor" required>
                </div>
                <div class="form-group">
                    <label for="archivo" class="form-label">Seleccionar Archivo PDF (máximo 10 MB)</label>
                    <input type="file" class="form-control" id="archivo" name="archivo" accept="application/pdf" required onchange="validarTamanoArchivo()">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </div>
            </form>
        </div>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
