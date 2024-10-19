
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Repositorio de Pruebas ULS</title>
    <link rel="stylesheet" href="styles/styles.css"> 
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h2>Iniciar Sesión</h2>
            <form action="LoginServlet" method="post"> <!-- servlet maneja el login -->
                <div class="input-box">
                    <label for="email">Correo:</label>
                    <input type="email" id="email" name="email" required placeholder="Ingresa tu correo">
                </div>
                <div class="input-box">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required placeholder="Ingresa tu contraseña">
                </div>
                <button type="submit" class="btn-login">Iniciar Sesión</button>
            </form>
            <div class="register-link">
                <p>¿No tienes cuenta? <a href="register.jsp">Regístrate aquí</a></p>
            </div>
        </div>
    </div>
</body>
</html>

