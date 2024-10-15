<%-- Document : index Created on : 22-09-2024, 7:06:30 p. m. Author : benjaminurbinarusque --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <title>Inicio</title>
            <link rel="stylesheet" href="styles/styles.css" />
            <link rel="icon" href="images/logopruebas.jpeg">
        </head>

        <body>
            <%@include file="navbar.jsp" %>
                <div class="First-Impression container-fluid d-flex shadow-lg p-3 mb-5 bg-body-tertiary">
                    <h1 class="Titulo-Inicio">Bienvenidos a PruebULS</h1>
                    <div class="contenedor-parrafo">
                        <p class="Presentacion">Esta es una pagina creada por estudiantes de la carrera ING COMP, este
                            proyecto tiene como idea la
                            recopilacion de pruebas de distintos profesores que tienen las carreras de todas las
                            ingienerias. Todas las pruebas son recolectadas de forma manual para posteriomente
                            ser utilizadas en esta pagina web.

                            Si quieren aportar de alguna forma pueden escribirnos un correo a ...... o puedo hacero <a
                                href="aporte.jsp"> aquí.</a>
                        </p>
                    </div>
                </div>
                <h1 class="destacados-profesores">Profesores Destacados</h1>
                <!-- card 1-->
                <div class="container mt-4 d-flex justify-content-center gap-4 ">
                    <div class="card shadow p-3 mb-5 bg-body-tertiary rounded" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk
                                of the card's content.</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">An item</li>
                            <li class="list-group-item">A second item</li>
                            <li class="list-group-item">A third item</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
                    <!-- fin card 1-->

                    <!-- card 2-->
                    <div class="card shadow p-3 mb-5 bg-body-tertiary rounded" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk
                                of the card's content.</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">An item</li>
                            <li class="list-group-item">A second item</li>
                            <li class="list-group-item">A third item</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
                    <!--fin  card 2-->

                    <!-- card 3-->
                    <div class="card shadow p-3 mb-5 bg-body-tertiary rounded" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk
                                of the card's content.</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">An item</li>
                            <li class="list-group-item">A second item</li>
                            <li class="list-group-item">A third item</li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                        </div>
                    </div>
                    <!-- fin card 3-->
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                    crossorigin="anonymous"></script>
        </body>

        </html>