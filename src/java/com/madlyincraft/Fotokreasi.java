/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

/**
 *
 * @author putih
 */
public class Fotokreasi {

    private String id;
    private String date_posted;
    private String url;
    private int total_vote_up;
    private int total_vote_down;

    public Fotokreasi(String id, String date_posted, String url, int total_vote_up, int total_vote_down) {
        this.id = id;
        this.date_posted = date_posted;
        this.url = url;
        this.total_vote_up = total_vote_up;
        this.total_vote_down = total_vote_down;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate_posted() {
        return date_posted;
    }

    public void setDate_posted(String date_posted) {
        this.date_posted = date_posted;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getTotal_vote_up() {
        return total_vote_up;
    }

    public void setTotal_vote_up(int total_vote_up) {
        this.total_vote_up = total_vote_up;
    }

    public int getTotal_vote_down() {
        return total_vote_down;
    }

    public void setTotal_vote_down(int total_vote_down) {
        this.total_vote_down = total_vote_down;
    }

}
