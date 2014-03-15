/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.madlyincraft;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author putih
 */
public class DatabaseInfo {
    public static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
    public static final String DATABASE_URL = "jdbc:mysql://localhost/books";
    public static final String DATABASE_USERNAME = "root";
    public static final String DATABASE_PASSWORD = "";
    private Connection con = null;
    private Statement stmt = null;
    
    private void openConnection() {
        try {
            Class.forName(DATABASE_DRIVER);
            
            con = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
            stmt = con.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e){
            
        }
    }
    
    private void closeConnection(){
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public ArrayList<Book> getAllBook() {
        String query = "SELECT * FROM titles";
        
        ArrayList<Book> bookList = new ArrayList<Book>();
        
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                Book b = new Book(
                        res.getString("isbn"),
                        res.getString("title"),
                        res.getInt("editionNumber"),
                        res.getString("publisher"),
                        res.getInt("price")
                );
                bookList.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return bookList;
    }
    
    public String addBook(String isbn, String title, String editionNumber, String publisher, String price) {
        String query = "INSERT INTO titles VALUES ("+isbn+",'"+title+"',"+editionNumber+",'"+publisher+"',"+price+")";
        
        try {
            openConnection();
            stmt.executeUpdate(query);
            return "Pengisian buku berhasil!";
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            return "Pengisian buku gagal. Coba cek lagi data pengisian.";
        } finally {
            closeConnection();
        }
    }
    
    public int doUpdate(String query) {
        int ret = 0;
        
        try {
            openConnection();
            ret = stmt.executeUpdate(query);
        } catch (SQLException e){
            
        } finally {
            closeConnection();
        }
        return ret;
    }
    
    
    
}
