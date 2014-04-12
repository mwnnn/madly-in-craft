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
    public static final String DATABASE_URL = "jdbc:mysql://localhost/madlyincraft";
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
        } catch (SQLException e) {

        }
    }

    private void closeConnection() {
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

    public boolean register(String username, String password, String displayPicture) {
        String query = "INSERT INTO registeredUser ";

        return false;
    }

    public boolean login(String username, String password) {
        boolean authenticated = false;
        String query = "SELECT COUNT(*) FROM user WHERE username='" + username + "' AND password='" + password + "'";

        try {
            openConnection();

            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                authenticated = res.getInt(1) == 1;
            }
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return authenticated;
    }

    public boolean isUserExist(String username) {
        boolean exist = false;
        String query = "SELECT COUNT(*) FROM user WHERE username='" + username + "'";

        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                exist = res.getInt(1) == 1;
            }
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return exist;
    }

    public boolean updateProfile(String username, String name, String dp, String email, String oldPassword, String newPassword) {
        boolean authenticated = false;
        String query = "UPDATE registeredUser set "
                + "username='" + username + "',"
                + "name='" + name + "',"
                + "dp='" + dp + "',"
                + "email='" + email + "',"
                + "password='" + newPassword + "' "
                + "WHERE password='" + oldPassword + "'";

        try {
            openConnection();

            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                authenticated = res.getInt(1) == 1;
            }
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return authenticated;
    }

    public int addLike(String tutorialId) {
        boolean authenticated = false;
        int res = 0;
        int id = Integer.parseInt(tutorialId);
        String query = "UPDATE tutorial SET "
                + "total_like=total_like + 1"
                + "WHERE id=" + id;
        try {
            openConnection();
            res = stmt.executeUpdate(query);
            //authenticated = res;
            
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        //return authenticated;
        return res;
    }
    
    public boolean addVoteUp(String fotoKreasiId) {
        boolean authenticated = false;
        String query = "UPDATE Foto_kreasi SET "
                + "total_voteup=total_voteup + 1"
                + "WHERE id='" + fotoKreasiId + "'";
        try {
            openConnection();

            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                authenticated = res.getInt(1) == 1;
            }
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return authenticated;
    }
    
    public boolean addVoteDown(String fotoKreasiId) {
        boolean authenticated = false;
        String query = "UPDATE Foto_kreasi SET "
                + "total_votedown=total_votedown + 1"
                + "WHERE id='" + fotoKreasiId + "'";
        try {
            openConnection();

            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                authenticated = res.getInt(1) == 1;
            }
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return authenticated;
    }
    
    public ArrayList<Tutorial> getAllTutorial() {
        String query = "SELECT * FROM tutorial";

        ArrayList<Tutorial> tutorialList = new ArrayList<Tutorial>();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                Tutorial b = new Tutorial(
                        res.getInt("id"),
                        res.getString("user_id"),
                        res.getString("title"),
                        res.getString("content"),
                        res.getInt("total_like"),
                        res.getString("date_posted"),
                        res.getString("difficulty"),
                        res.getString("kategori")
                );
                tutorialList.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return tutorialList;
    }
    
    public ArrayList<Fotokreasi> getAllFotokreasi() {
        String query = "SELECT * FROM foto_kreasi";

        ArrayList<Fotokreasi> fotokreasiList = new ArrayList<Fotokreasi>();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                Fotokreasi b = new Fotokreasi(
                        res.getInt("id"),
                        res.getInt("tutorial_id"),
                        res.getString("user_id"),
                        res.getString("date_posted"),
                        res.getString("url"),
                        res.getInt("total_voteup"),
                        res.getInt("total_votedown")
                );
                fotokreasiList.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return fotokreasiList;
    }

    public String addTutorial(String isbn, String title, String editionNumber, String publisher, String price) {
        String query = "INSERT INTO titles VALUES (" + isbn + ",'" + title + "'," + editionNumber + ",'" + publisher + "'," + price + ")";

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
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return ret;
    }

}
