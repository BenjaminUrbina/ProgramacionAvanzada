<%-- 
    Document   : administrar_archivos
    Created on : 16-11-2024, 4:30:02 p. m.
    Author     : matia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
        <title>administrar archivos</title>
        <link rel="icon" href="images/logopruebas.jpeg">
        <link rel="stylesheet" href="styles/gestionarArchivos.css">
        
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <div class="container mt-5">
            <h1 class="text-center">Gestionar Estado de Documentos</h1>

            <div class="table-container">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Nombre del Archivo</th>
                            <th>Curso</th>
                            <th>Año</th>
                            <th>Semestre</th>
                            <th>Profesor</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Map<String, String>> documentos = (List<Map<String, String>>) request.getAttribute("documentos");
                            if (documentos != null && !documentos.isEmpty()) {
                                out.println("<div class='alert alert-success'>Documentos recibidos: " + documentos.size() + "</div>");
                                for (Map<String, String> doc : documentos) {
                        %>
                        <tr>
                            <td><%= doc.get("nombre") %></td>
                            <td><%= doc.get("curso") %></td>
                            <td><%= doc.get("ano") %></td>
                            <td><%= doc.get("semestre") %></td>
                            <td><%= doc.get("profesor") %></td>
                            <td><%= doc.get("estado") %></td>
                            <td>
                                <form action="SvAdminArchivo" method="POST">
                                    <input type="hidden" name="hashDocumento" value="<%= doc.get("hash") %>">
                                    <input type="hidden" name="nombre" value="<%= doc.get("nombre") %>">
                                    <input type="hidden" name="profesor" value="<%= doc.get("profesor") %>">
                                    <select class="form-select" name="nuevoEstado">
                                        <option value="Pendiente" <%= "Pendiente".equals(doc.get("estado")) ? "selected" : "" %>>Pendiente</option>
                                        <option value="Aprobado" <%= "Aprobado".equals(doc.get("estado")) ? "selected" : "" %>>Aprobado</option>
                                        <option value="Denegado" <%= "Denegado".equals(doc.get("estado")) ? "selected" : "" %>>Denegado</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary mt-2">Cambiar Estado</button>
                                </form>
                            </td>
                        </tr>
                        <% 
                                }
                            } else {
                            out.println("<div class='alert alert-danger'>No se recibieron documentos desde el servlet.</div>");
                        %>
                        <tr>
                            <td colspan="7" class="text-center">No hay documentos disponibles</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
