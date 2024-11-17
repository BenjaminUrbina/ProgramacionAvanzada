<%-- Document : navbar Created on : 22-09-2024, 7:56:20 p. m. Author : benjaminurbinarusque --%>

  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <link rel="stylesheet" href="styles/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <html>

    <head>
    </head>

    <body>
      <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
          <a class="navbar-brand " href="index.jsp">
            <img src="images/logopruebasin.png" alt="" width="" height="70px">
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
                <a class="nav-link navbaroptions" href="pruebas_search.jsp">Pruebas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link navbaroptions" href="aporte.jsp">Aportes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link navbaroptions" href="login.jsp">Login</a>
              </li>
              <li class="nav-item">
                <a class="nav-link navbaroptions" href="SvAdminArchivo">administrar archivos</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </body>

    </html>