/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.madlyincraft;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author putih
 */
public class DatabaseInfo extends HttpServlet {

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
    
    public boolean loginAdmin(String username, String password) {
        boolean authenticated = false;
        String queryAdmin = "SELECT COUNT(*) FROM admin WHERE username='" + username + "' AND password='" + password + "'";

        try {
            openConnection();

            ResultSet res = stmt.executeQuery(queryAdmin);
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

            int res = stmt.executeUpdate(query);
            
           
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return authenticated;
    }

    public int addLike(String tutorialId) {
        boolean authenticated = false;
        int res = 0;
        String query = "UPDATE tutorial SET "
                + "total_like=total_like + 1"
                + "WHERE id='" + tutorialId + "'";
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

            int res = stmt.executeUpdate(query);
//            while (res.next()) {
//                authenticated = res.getInt(1) == 1;
//            }
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

            int res = stmt.executeUpdate(query);
//            while (res.next()) {
//                authenticated = res.getInt(1) == 1;
//            }
        } catch (SQLException e) {

        } finally {
            closeConnection();
        }
        return authenticated;
    }

    public ArrayList<Tutorial> getAllTutorial() {
        String query = "SELECT * FROM tutorial";

        ArrayList<Tutorial> tutorialList = new ArrayList<>();
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
                        res.getString("kategori"),
                        res.getString("featured_image"),
                        res.getString("status")
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

    public ArrayList<Tutorial> getUserTutorial(String uid) {
        String query = "SELECT * FROM tutorial WHERE USER_ID='" + uid + "'";

        ArrayList<Tutorial> tutorialList = new ArrayList<>();
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
                        res.getString("kategori"),
                        res.getString("featured_image"),
                        res.getString("status")
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

    public ArrayList<Tutorial> getFeaturedTutorial() {
        String query = "SELECT * FROM tutorial ORDER BY total_like DESC LIMIT 3";

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
                        res.getString("kategori"),
                        res.getString("featured_image"),
                        res.getString("status")
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

    public User getMemberData(String username) {
        String query = "SELECT * FROM USER WHERE USERNAME = '" + username + "';";
        User user = new User();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                user = new User(
                        res.getString("username"),
                        res.getString("password"),
                        res.getString("display_picture"),
                        res.getString("email")
                );
                user.setDescription(res.getString("description"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return user;
    }

    public ArrayList<Message> getMessageList(String query) {
        ArrayList<Message> mList = new ArrayList<Message>();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                Message m = new Message(
                        res.getString("id"),
                        res.getString("content"),
                        res.getString("sender_id"),
                        res.getString("receiver_id"),
                        res.getTimestamp("date_posted")
                );
                mList.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return mList;
    }

    public ArrayList<String> linkList(String query) {
        ArrayList<String> lList = new ArrayList<String>();
        try {
            openConnection();

            ResultSet res3 = stmt.executeQuery(query);

            while (res3.next()) {
                lList.add(res3.getString("url"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return lList;
    }

    public ArrayList<User> getFeaturedMember() {
        String query = "SELECT * FROM TUTORIAL, USER WHERE USER.USERNAME = TUTORIAL.USER_ID ORDER BY tutorial.total_like DESC;";
        ArrayList<User> userList = new ArrayList<User>();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                User u = new User(
                        res.getString("username"),
                        res.getString("password"),
                        res.getString("display_picture"),
                        res.getString("email")
                );
                userList.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return userList;
    }

    public ArrayList<Tutorial> getLatestTutorial() {
        String query = "SELECT * FROM tutorial ORDER BY DATE_POSTED DESC LIMIT 0 , 8";

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
                        res.getString("kategori"),
                        res.getString("featured_image"),
                        res.getString("status")
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

    public ArrayList<Tutorial> getByCategory(String kategori) {
        String query = "SELECT * FROM tutorial WHERE KATEGORI='" + kategori + "';";

        ArrayList<Tutorial> tutorialList = new ArrayList<Tutorial>();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                Tutorial b = new Tutorial(
                        res.getInt("id"),
                        res.getString("date_posted"),
                        res.getString("difficulty"),
                        res.getString("title"),
                        res.getString("content"),
                        res.getInt("total_like"),
                        res.getString("featured_image")
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

    public ArrayList<Tutorial> getByKeyword(String keyword) {
        String query = "SELECT * FROM tutorial WHERE TITLE LIKE '%" + keyword + "%' OR CONTENT LIKE '%" + keyword + "%';";

        ArrayList<Tutorial> tutorialList = new ArrayList<Tutorial>();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                Tutorial b = new Tutorial(
                        res.getInt("id"),
                        res.getString("date_posted"),
                        res.getString("difficulty"),
                        res.getString("title"),
                        res.getString("content"),
                        res.getInt("total_like"),
                        res.getString("featured_image")
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

    public Tutorial getTutorialByID(String id) {
        Tutorial t = new Tutorial();
        TutorialStep ts = new TutorialStep();
        ArrayList<TutorialStep> tsList = new ArrayList<TutorialStep>();
        String query = "SELECT * FROM TUTORIAL WHERE ID = '" + id + "';";
        String query2 = "SELECT * FROM tutorial_steps WHERE TUTORIAL_ID = '" + id + "';";
        String query3 = "SELECT * FROM comment WHERE TUTORIAL_ID ='" + id + "' ORDER BY DATE_POSTED desc;";
        ArrayList<Comment> cList = new ArrayList<Comment>();
        String query4 = "SELECT * FROM material WHERE TUTORIAL_ID ='" + id + "';";
        ArrayList<Material> mList = new ArrayList<Material>();

        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                t = new Tutorial(
                        res.getInt("id"),
                        res.getString("date_posted"),
                        res.getString("difficulty"),
                        res.getString("title"),
                        res.getString("content"),
                        res.getInt("total_like"),
                        res.getString("featured_image")
                );
            }
            ResultSet res2 = stmt.executeQuery(query2);
            while (res2.next()) {
                ts = new TutorialStep(
                        res2.getInt("nomor"),
                        res2.getString("deskripsi"),
                        res2.getString("link_gambar")
                );
                tsList.add(ts);
            }

            ResultSet resultset = stmt.executeQuery(query3);
            while (resultset.next()) {
                Comment c = new Comment(
                        resultset.getString("id"),
                        resultset.getString("content"),
                        resultset.getTimestamp("date_posted"),
                        resultset.getString("user_id")
                );
                cList.add(c);
            }

            ResultSet resultset2 = stmt.executeQuery(query4);
            while (resultset2.next()) {
                Material m = new Material(
                        resultset2.getInt("id"),
                        resultset2.getString("nama")
                );
                mList.add(m);
            }
            t.setStep(tsList);
            t.setKomentar(cList);
            t.setBahan(mList);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return t;
    }

    public ArrayList<Kategori> getKategori() {
        String query = "SELECT * FROM kategori";

        ArrayList<Kategori> kList = new ArrayList<Kategori>();
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                Kategori k = new Kategori(
                        res.getString("NAMA_KATEGORI")
                );
                kList.add(k);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
        return kList;
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

    public int addTutorial(String userId, String title, String category, String imageLink, String description, String difficulty, ArrayList<Material> material, ArrayList<TutorialStep> tutStep) {
        // get latest tutorial id
        String tutorialIdQuery = "SELECT `ID` FROM `madlyincraft`.`tutorial` ORDER BY `tutorial`.`ID`  DESC LIMIT 0,1";
        int tutorialId = 0;
        try {
            openConnection();
            ResultSet res = stmt.executeQuery(tutorialIdQuery);
            if (res.next()) {
            tutorialId = res.getInt("ID") + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("ambil latest tuto id gagal");
            //return "";
        } finally {
            closeConnection();
        }
        System.out.println(tutorialId);
        // end of get latest tutorial id

        // add materials
        // create materials query
        String addMaterialsQuery = "INSERT INTO  `madlyincraft`.`material` VALUES ";
        for (int i = 0; i < material.size(); i++) {
            if (i == material.size() - 1) {
                addMaterialsQuery += "(" + material.get(i).getId() + "," + tutorialId + ",'" + material.get(i).getNama() + "')";
            } else {
                addMaterialsQuery += "(" + material.get(i).getId() + "," + tutorialId + ",'" + material.get(i).getNama() + "'), ";
            }
        }
        // add materials to db
        try {
            openConnection();
            stmt.executeUpdate(addMaterialsQuery);
            //return "Pengisian material berhasil";
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            //return "Pengisian material gagal";
        } finally {
            closeConnection();
        }
        // end of add materials

        // add tutorial steps
        // create tutorial steps query
        String addTutorialStepsQuery = "INSERT INTO  `madlyincraft`.`tutorial_steps` VALUES ";
        for (int i = 0; i < tutStep.size(); i++) {
            int num = i + 1;
            if (i == tutStep.size() - 1) {
                addTutorialStepsQuery += "(" + tutorialId + "," + num + ",'" + tutStep.get(i).getDeskripsi() + "','" + tutStep.get(i).getLink_gambar() + "')";
            } else {
                addTutorialStepsQuery += "(" + tutorialId + "," + num + ",'" + tutStep.get(i).getDeskripsi() + "','" + tutStep.get(i).getLink_gambar() + "'), ";
            }
        }
        // add tutorial steps to db
        try {
            openConnection();
            stmt.executeUpdate(addTutorialStepsQuery);
            //return "Pengisian material berhasil";
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            //return "Pengisian material gagal";
        } finally {
            closeConnection();
        }
        // end of add tutorial steps

        // get current time
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String date = dateFormat.format(cal.getTime());
        //System.out.println(dateFormat.format(cal.getTime()));

        // add tutorial
        // create query
        String query = "INSERT INTO  `madlyincraft`.`tutorial` VALUES (" + tutorialId + ",'" + userId + "','" + title + "','" + description + "'," + 0 + ",'" + date + "','" + difficulty + "','" + category + "','" + imageLink + "','unapproved')";
        // add tutorial to db
        int resInt = 0;
        try {
            openConnection();
            resInt = stmt.executeUpdate(query);
            //return "Pengisian tutorial berhasil";
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            //return "Pengisian tutorial gagal";
        } finally {
            closeConnection();
        }
        // end of add tutorial

        return resInt;

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
