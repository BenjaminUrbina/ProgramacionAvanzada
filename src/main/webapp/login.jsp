<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Repositorio de Pruebas ULS</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles/styles.css"> 
    <link rel="stylesheet" href="styles/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h2 class="title-login">Iniciar Sesi�n</h2>
            
            <!-- Mensaje de error -->
            <% if (request.getParameter("error") != null) { %>
                <p style="color: red;">Usuario o contrase�a incorrectos</p>
            <% } %>
            
            <form action="LoginServlet" method="post"> <!-- servlet maneja el login -->
                <div class="input-box">
                    <label for="email" class="correo">Correo:</label>
                    <input type="email" id="email" name="email" required placeholder="Ingresa tu correo">
                </div>
                <div class="input-box">
                    <label for="password" class="contrasena">Contrase�a:</label>
                    <input type="password" id="password" name="password" required placeholder="Ingresa tu contraseña">
                </div>
                <button type="submit" class="btn-login">Iniciar Sesi�n</button>
            </form>
            <div class="register-link">
                <p>�No tienes cuenta? <a href="register.jsp">Reg��strate aqu��</a></p>
            </div>
        </div>
    </div>
</body>
</html>
