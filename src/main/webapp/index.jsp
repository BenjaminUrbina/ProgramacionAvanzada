<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="images/logopruebasin.png">
    <link rel="stylesheet" href="styles/styles.css">
    <title>PruebULS - Inicio</title>
</head>

<body class="bg-light">
    <%@include file="navbar.jsp"%>
    
    <!-- Hero Section -->
    <div class="container-fluid py-5 text-white mb-5 d-flex" id="hero">
        <div class="container d-flex flex-column alig-items-center justify-content-center">
            <h1 class="display-4 fw-bold mb-4 text-center">Bienvenidos a PruebULS</h1>
            <p class="lead mb-4">
                Esta es una plataforma creada por estudiantes de Ingeniería en Computación, 
                dedicada a la recopilación de pruebas de distintos profesores de todas las 
                ingenierías. Nuestro objetivo es crear un recurso valioso para la comunidad 
                estudiantil.
            </p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <a href="PruebaP.jsp" class="btn btn-light btn-lg px-4 gap-3">
                    Realizar un aporte
                </a>
            </div>
        </div>
    </div>

    <!-- Counter Section -->
    <div class="container text-center mb-5">
        <div class="bg-white shadow-sm p-4">
            <h2 class="h4 mb-3">Total de Pruebas Disponibles</h2>
            <div class="display-1 fw-bold text-primary mb-3">
                <span class="contador" data-val="340">0</span>
            </div>
            <p class="text-muted">Y seguimos creciendo gracias a sus aportes</p>
        </div>
    </div>

    <!-- Professors Section -->
    <div class="container mb-5">
        <h2 class="text-center mb-4">Profesores con más material</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Profesor Card 1 -->
            <div class="col">
                <div class="h-100 shadow-sm hover-shadow">
                    <div class="position-relative">
                        <img src="images/godzalo.jpeg" class="card-img-top" alt="Profesor">
                        <span class="position-absolute top-0 end-0 badge bg-primary m-2">
                            Top 1
                        </span>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Profesor González</h5>
                        <p class="card-text">Especialista en Cálculo y Álgebra Lineal con más de 10 años de experiencia.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Pruebas disponibles</span>
                            <span class="badge bg-primary rounded-pill">24</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Asignaturas</span>
                            <span class="badge bg-secondary rounded-pill">3</span>
                        </li>
                    </ul>
                    <div class="card-footer bg-transparent border-0">
                        <a href="#" class="btn btn-primary w-100">Ver pruebas</a>
                    </div>
                </div>
            </div>

            <!-- Profesor Card 2 -->
            <div class="col">
                <div class="h-100 shadow-sm hover-shadow">
                    <div class="position-relative">
                        <img src="images/godzalo.jpeg" class="card-img-top" alt="Profesor">
                        <span class="position-absolute top-0 end-0 badge bg-primary m-2">
                            Top 2
                        </span>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Profesora Martínez</h5>
                        <p class="card-text">Docente de Física y Mecánica, reconocida por su excelente metodología.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Pruebas disponibles</span>
                            <span class="badge bg-primary rounded-pill">18</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Asignaturas</span>
                            <span class="badge bg-secondary rounded-pill">2</span>
                        </li>
                    </ul>
                    <div class="card-footer bg-transparent border-0">
                        <a href="#" class="btn btn-primary w-100">Ver pruebas</a>
                    </div>
                </div>
            </div>

            <!-- Profesor Card 3 -->
            <div class="col">
                <div class="h-100 shadow-sm hover-shadow">
                    <div class="position-relative">
                        <img src="images/godzalo.jpeg" class="card-img-top" alt="Profesor">
                        <span class="position-absolute top-0 end-0 badge bg-primary m-2">
                            Top 3
                        </span>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Profesor Rodríguez</h5>
                        <p class="card-text">Experto en Programación y Estructuras de Datos con enfoque práctico.</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Pruebas disponibles</span>
                            <span class="badge bg-primary rounded-pill">15</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Asignaturas</span>
                            <span class="badge bg-secondary rounded-pill">4</span>
                        </li>
                    </ul>
                    <div class="card-footer bg-transparent border-0">
                        <a href="#" class="btn btn-primary w-100">Ver pruebas</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="js/index.js"></script>
</body>
</html>