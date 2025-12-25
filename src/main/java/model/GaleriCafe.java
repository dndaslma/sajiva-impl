/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dinda salma
 */
public class GaleriCafe {
    private int id;
    private int idCafe;
    private String foto;

    public GaleriCafe() {}

    public GaleriCafe(int idCafe, String foto) {
        this.idCafe = idCafe;
        this.foto = foto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCafe() {
        return idCafe;
    }

    public void setIdCafe(int idCafe) {
        this.idCafe = idCafe;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
}

