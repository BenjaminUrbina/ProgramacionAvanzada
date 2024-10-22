/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Obtener el select del año
const yearSelect = document.getElementById('ano');

// Definir el año mínimo y el año máximo (actual)
const minYear = 2000;
const maxYear = new Date().getFullYear(); // Obtiene el año actual

// Generar las opciones de año dinámicamente
for (let year = maxYear; year >= minYear; year--) {
    let option = document.createElement('option');
    option.value = year;
    option.text = year;
    yearSelect.add(option);
}

