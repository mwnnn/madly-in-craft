/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.sql.Timestamp;

/**
 *
 * @author putih
 */
public class Tutorial {

    private String Id;
    private Timestamp date_posted;
    private String difficulty;
    private String title;
    private String content;
    private int total_like;

    public Tutorial(String Id, Timestamp date_posted, String difficulty, String title, String content, int total_like) {
        this.Id = Id;
        this.date_posted = date_posted;
        this.difficulty = difficulty;
        this.title = title;
        this.content = content;
        this.total_like = total_like;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public Timestamp getDate_posted() {
        return date_posted;
    }

    public void setDate_posted(Timestamp date_posted) {
        this.date_posted = date_posted;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTotal_like() {
        return total_like;
    }

    public void setTotal_like(int total_like) {
        this.total_like = total_like;
    }

}
