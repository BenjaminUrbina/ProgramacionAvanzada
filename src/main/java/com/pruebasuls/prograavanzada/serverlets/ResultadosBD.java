/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pruebasuls.prograavanzada.serverlets;

/**
 *
 * @author benjaminurbinarusque
 */
public class ResultadosBD {
    private String profesor;
    private String asignatura;
    private int year;
    private int semestre;
    private String nombreArchivo;
    private byte[] documento;

    public ResultadosBD() {
    }

    public String getProfesor() {
        return profesor;
    }

    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public String getNombreArchivo() {
        return nombreArchivo;
    }

    public void setNombreArchivo(String nombreArchivo) {
        this.nombreArchivo = nombreArchivo;
    }
    
    public byte[] getDocumento() {
        return documento;
    }
    
    public void setDocumento(byte[] documento) {
        this.documento = documento;
    }
}
