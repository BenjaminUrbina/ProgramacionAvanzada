<%-- 
    Document   : aporte
    Created on : 22-09-2024, 8:47:21 p. m.
    Author     : benjaminurbinarusque
--%>
<%--ññññññ áááááááa´´a --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
        <title>aportes</title>
        <link rel="icon" href="images/logopruebasin.png">
        <link rel="stylesheet" href="styles/diseñoformulario.css">
        <title>Aportes</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container my-4">
            <div class="row">
                    <div class="columna col-lg-6">
                        <div class="panel-titulos">
                            <h2 class = "text-center Titulos">Bienvenido a la sección de envío de archivos</h2>
                        </div>
                        <div class="panel-cuerpo">
                            <p class = "Parrafo">En esta página puedes enviar archivos de forma rápida y sencilla. Sigue los pasos a continuación para completar el formulario:</p>
                            <ol>
                                <li class = "Linea">Ingresa el nombre del archivo que deseas subir, es importante que el nombre tenga relacion con la actividad del material por ejemplo(guia geometria analitica, control trigonometria).</li>
                                <li class = "Linea">Escribe el nombre del profesor que creo el material con el formato: NOMBRE APELLIDO</li>
                                <li class = "Linea">Escribe el nombre de la asignatura a la que pertenece el material</li>
                                <li class = "Linea">Selecciona el año en el que corresponde el archivo.</li>
                                <li class = "Linea">Indica el semestre academico al que pertenece el archivo.</li>
                                <li class = "Linea">Sube el archivo en formato PDF (máximo 10 MB).</li>
                                <li class = "Linea">Haz clic en el botón "Enviar" para completar el proceso.</li>
                            </ol>
                        </div>

                    </div>
                    <div class="columna col-lg-6">
                        <div class="panel-titulos">
                            <h1 class="text-center Titulos">Formulario de Envío</h1>
                        </div>
                        <div class="panel-cuerpo">
                            <!-- FORMULARIO PARA SOLICITUD --> 

                            <form action="SvAporte" method="POST" enctype="multipart/form-data">
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
                                <div class="form-group">
                                    <label for="archivo" class="form-label">Seleccionar Archivo PDF (máximo 10 MB)</label>
                                    <input type="file" class="form-control" id="archivo" name="archivo" accept="application/pdf" required onchange="validarTamanoArchivo()">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Enviar</button>
                                </div>
                            </form>
                        </div>

                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
        <script src="js/aporte.js"></script>
    </body>
</html>
