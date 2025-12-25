/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dinda salma
 */

import java.sql.Timestamp;

public class VerifikasiCafe {

    private int id;
    private int idAkun;
    private String namaPemilik;
    private String namaCafe;
    private String email;
    private String fileName;
    private Timestamp tanggalSubmit;
    private String status;

    public VerifikasiCafe(int id, int idAkun, String namaPemilik, String namaCafe, String email, String fileName, String status, Timestamp tanggalSubmit) {
    this.id = id;
    this.idAkun = idAkun;
    this.namaPemilik = namaPemilik;
    this.namaCafe = namaCafe;
    this.email = email;
    this.fileName = fileName;
    this.status = status;
    this.tanggalSubmit = tanggalSubmit;
}

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getId() { return id; }
    public String getNamaPemilik() { return namaPemilik; }
    public String getNamaCafe() { return namaCafe; }
    public String getEmail() { return email; }
    public String getFileName() { return fileName; }
    public Timestamp getTanggalSubmit() { return tanggalSubmit; }
}
