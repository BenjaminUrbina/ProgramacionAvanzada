<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles/navbar.css">
    <link rel="icon" href="images/logopruebasin.png">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">
                <img src="images/logopruebasin.png" alt="Logo" height="70px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link navbaroptions" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbaroptions" href="pruebas_search.jsp">Buscar Pruebas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbaroptions" href="aporte.jsp">Aportes</a>
                    </li>
                    <%-- Verificar si el usuario está logueado --%>
                    <%
                        if (session != null && session.getAttribute("user") != null) {
                    %>
                        <li class="nav-item">
                            <a class="nav-link navbaroptions" href="SvLogout">Cerrar sesión</a>
                        </li>
                        <%-- Mostrar "Administrar archivos" si el usuario es admin --%>
                        <%
                            Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
                            if (isAdmin != null && isAdmin) {
                        %>
                            <li class="nav-item">
                                <a class="nav-link navbaroptions" href="SvAdminArchivo">Administrar Archivos</a>
                            </li>
                        <%
                            }
                        %>
                    <%  
                        } else {
                    %>
                        <li class="nav-item">
                            <a class="nav-link navbaroptions" href="login.jsp">Login</a>
                        </li>
                    <%  
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>