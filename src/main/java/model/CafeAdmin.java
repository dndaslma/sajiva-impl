/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dinda salma
 */
public class CafeAdmin {

    private int id;
    private String namaCafe;
    private String namaPemilik;
    private String email;
    private String alamat;

    public CafeAdmin(int id, String namaCafe,
                     String namaPemilik, String email,
                     String alamat) {

        this.id = id;
        this.namaCafe = namaCafe;
        this.namaPemilik = namaPemilik;
        this.email = email;
        this.alamat = alamat;
    }

    public int getId() {
        return id;
    }

    public String getNamaCafe() {
        return namaCafe;
    }

    public String getNamaPemilik() {
        return namaPemilik;
    }

    public String getEmail() {
        return email;
    }

    public String getAlamat() {
        return alamat;
    }
}

