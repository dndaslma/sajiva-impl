/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dinda salma
 */
public class Cafe {

    private int id;
    private int idAkun;

    private String nama;
    private String alamat;
    private String jamOperasional;
    private String menu;
    private String harga;
    private String fasilitas;
    private String suasana;
    private String latitude;
    private String longitude;
    private String namaPemilik;

    public Cafe(int id, String nama, String alamat, String jamOperasional,
                String menu, String harga, String fasilitas,
                String suasana, String latitude, String longitude, int idAkun) {
        this.id = id;
        this.nama = nama;
        this.alamat = alamat;
        this.jamOperasional = jamOperasional;
        this.menu = menu;
        this.harga = harga;
        this.fasilitas = fasilitas;
        this.suasana = suasana;
        this.latitude = latitude;
        this.longitude = longitude;
        this.idAkun = idAkun;
    }

    public Cafe(String nama, String alamat, String jamOperasional,
                String menu, String harga, String fasilitas,
                String suasana, String latitude, String longitude, int idAkun) {
        this.nama = nama;
        this.alamat = alamat;
        this.jamOperasional = jamOperasional;
        this.menu = menu;
        this.harga = harga;
        this.fasilitas = fasilitas;
        this.suasana = suasana;
        this.latitude = latitude;
        this.longitude = longitude;
        this.idAkun = idAkun;
    }
    public Cafe(int id, String nama, String alamat, String jamOperasional, String menu, 
                String harga, String fasilitas, String suasana, String latitude, String longitude) {
        this.id = id;
        this.nama = nama;
        this.alamat = alamat;
        this.jamOperasional = jamOperasional;
        this.menu = menu;
        this.harga = harga;
        this.fasilitas = fasilitas;
        this.suasana = suasana;
        this.latitude = latitude;
        this.longitude = longitude;
    }
    
    public Cafe(int id, String nama, String alamat,
                String jamOperasional, String menu, String harga,
                String fasilitas, String suasana,
                String latitude, String longitude,
                int idAkun, String namaPemilik) {

        this.id = id;
        this.nama = nama;
        this.alamat = alamat;
        this.jamOperasional = jamOperasional;
        this.menu = menu;
        this.harga = harga;
        this.fasilitas = fasilitas;
        this.suasana = suasana;
        this.latitude = latitude;
        this.longitude = longitude;
        this.idAkun = idAkun;
        this.namaPemilik = namaPemilik;
    }

    public Cafe() {}
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAkun() {
        return idAkun;
    }

    public void setIdAkun(int idAkun) {
        this.idAkun = idAkun;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getJamOperasional() {
        return jamOperasional;
    }

    public void setJamOperasional(String jamOperasional) {
        this.jamOperasional = jamOperasional;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getHarga() {
        return harga;
    }

    public void setHarga(String harga) {
        this.harga = harga;
    }

    public String getFasilitas() {
        return fasilitas;
    }

    public void setFasilitas(String fasilitas) {
        this.fasilitas = fasilitas;
    }

    public String getSuasana() {
        return suasana;
    }

    public void setSuasana(String suasana) {
        this.suasana = suasana;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    // ===== GETTER & SETTER =====
    public void setLongitude(String longitude) {    
        this.longitude = longitude;
    }

    public String getNamaPemilik() {
        return namaPemilik;
    }

    public void setNamaPemilik(String namaPemilik) {
        this.namaPemilik = namaPemilik;
    }
    
    
}
