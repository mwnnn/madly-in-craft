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
public class Book {
    private String ISBN;
    private String title;
    private int editionNumber;
    private String publisher;
    private int price;

    public Book(String ISBN, String title, int editionNumber, String publisher, int price) {
        this.ISBN = ISBN;
        this.title = title;
        this.editionNumber = editionNumber;
        this.publisher = publisher;
        this.price = price;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getEditionNumber() {
        return editionNumber;
    }

    public void setEditionNumber(int editionNumber) {
        this.editionNumber = editionNumber;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}