/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.util.ArrayList;

/**
 *
 * @author putih
 */
public class User {

    private String username;
    private String password;
    private String display_picture;
    private String email;
    private ArrayList<Message> pesan;
    private ArrayList<String> link;
    private String description;

    public User(String username, String password, String display_picture, String email) {
        this.username = username;
        this.password = password;
        this.display_picture = display_picture;
        this.email = email;
        this.link = new ArrayList<String>();
        this.pesan = new ArrayList<Message>();
    }

    public User() {
        
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplay_picture() {
        return display_picture;
    }

    public void setDisplay_picture(String display_picture) {
        this.display_picture = display_picture;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ArrayList<Message> getPesan() {
        return pesan;
    }

    public void setPesan(ArrayList<Message> pesan) {
        this.pesan = pesan;
    }

    public ArrayList<String> getLink() {
        return link;
    }

    public void setLink(ArrayList<String> link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
