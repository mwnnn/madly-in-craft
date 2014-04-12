/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author putih
 */
public class Comment {

    private String id;
    private String content;
    private Timestamp timestamp;
    private String uname;

    public Comment(String id, String content, Timestamp timestamp, String username) {
        this.id = id;
        this.content = content;
        this.timestamp = timestamp;
        this.uname = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }
    
    

}
