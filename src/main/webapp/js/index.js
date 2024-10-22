
let valoresPantalla = document.querySelectorAll(".contador");

valoresPantalla.forEach((valoresPantalla) => {
    let valorinicial = 0;
    let valorFinal = parseInt(valoresPantalla.getAttribute("data-val"));
    let duration = 1; //Duracion de la animacion en ms
    let contador = setInterval(function () {
        valorinicial += 1;
        valoresPantalla.textContent = valorinicial;
        if (valorinicial == valorFinal) {
            clearInterval(contador);
        }
    },duration);
});