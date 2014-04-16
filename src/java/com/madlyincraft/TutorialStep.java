/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.madlyincraft;

/**
 *
 * @author Nabilah
 */
public class TutorialStep {
    int nomor;
    String deskripsi;
    String link_gambar;

    public TutorialStep() {
    }

    
    public TutorialStep(int nomor, String deskripsi, String link_gambar) {
        this.nomor = nomor;
        this.deskripsi = deskripsi;
        this.link_gambar = link_gambar;
    }

    public int getNomor() {
        return nomor;
    }

    public void setNomor(int nomor) {
        this.nomor = nomor;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public String getLink_gambar() {
        return link_gambar;
    }

    public void setLink_gambar(String link_gambar) {
        this.link_gambar = link_gambar;
    }
    
    
}
