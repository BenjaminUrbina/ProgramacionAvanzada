// Función para obtener el valor dinámico del servidor
function actualizarContadorDinamicamente() {
    // Obtener todos los elementos con la clase "contador"
    let valoresPantalla = document.querySelectorAll(".contador");

    // Hacer una solicitud al servlet
    fetch('ContadorServlet')
        .then(response => response.json())
        .then(data => {
            let valorFinal = data.count; // Obtener el valor del servidor
            valoresPantalla.forEach((valoresPantalla) => {
                let valorinicial = 0;
                let duration = 20; // Duración de la animación en ms

                // Establecer el atributo "data-val" dinámicamente
                valoresPantalla.setAttribute("data-val", valorFinal);

                // Animar el contador
                let contador = setInterval(function () {
                    valorinicial += 1;
                    valoresPantalla.textContent = valorinicial;
                    if (valorinicial >= valorFinal) {
                        clearInterval(contador);
                    }
                }, duration);
            });
        })
        .catch(error => console.error('Error al obtener el valor del servidor:', error));
}

// Llamar a la función para actualizar el contador dinámicamente
window.onload = actualizarContadorDinamicamente;
