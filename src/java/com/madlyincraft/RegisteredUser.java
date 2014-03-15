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
public class RegisteredUser extends User {

    private String email;
    private String link;

    public RegisteredUser(String username, String password, String display_picture, String email, String link) {
        super(username, password, display_picture);
        this.email = email;
        this.link = link;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    

}
