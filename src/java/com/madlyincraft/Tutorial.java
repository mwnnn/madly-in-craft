/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author putih
 */
public class Tutorial {

    private int id;
    private String user_id;
    private String title;
    private String content;
    private int total_like;
    private String date_posted;
    private String difficulty;
    private String kategori;
    private String featured_image;
    private String status;
    private ArrayList<TutorialStep> step;
    private ArrayList<Material> bahan;
    private ArrayList<Comment> komentar;
    
    public Tutorial(){
    }

    public Tutorial(int id, String user_id, String title, String content, int total_like, String date_posted, String difficulty, String kategori, String featured_image, String status) {
        this.id = id;
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.total_like = total_like;
        this.date_posted = date_posted;
        this.difficulty = difficulty;
        this.kategori = kategori;
        this.featured_image = featured_image;
        this.status = status;
    }

     public Tutorial(int Id, String date_posted, String difficulty, String title, String content, int total_like, String urlImage, String status) {
        this.id = Id;
        this.date_posted = date_posted;
        this.difficulty = difficulty;
        this.title = title;
        this.content = content;
        this.total_like = total_like;
        this.featured_image = urlImage;
        this.status = status;
    }

    public Tutorial(String Id, String date_posted, String difficulty, String title, String content, int total_like, String urlImage, ArrayList<TutorialStep> steps, ArrayList<Material> materials, ArrayList<Comment> comments){
        this.id = id;
        this.date_posted = date_posted;
        this.difficulty = difficulty;
        this.title = title;
        this.content = content;
        this.total_like = total_like;
        this.featured_image = urlImage;
        this.step = steps;
        this.bahan = materials;
        this.komentar = comments;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
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

    public String getDate_posted() {
        return date_posted;
    }

    public void setDate_posted(String date_posted) {
        this.date_posted = date_posted;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getFeatured_image() {
        return featured_image;
    }

    public void setFeatured_image(String featured_image) {
        this.featured_image = featured_image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<TutorialStep> getStep() {
        return step;
    }

    public void setStep(ArrayList<TutorialStep> step) {
        this.step = step;
    }

    public ArrayList<Material> getBahan() {
        return bahan;
    }

    public void setBahan(ArrayList<Material> bahan) {
        this.bahan = bahan;
    }

    public ArrayList<Comment> getKomentar() {
        return komentar;
    }

    public void setKomentar(ArrayList<Comment> komentar) {
        this.komentar = komentar;
    }

}
