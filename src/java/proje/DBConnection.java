/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proje;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Emree
 */
public class DBConnection {

    public User userObjesi;

    private Connection conn;

    public DBConnection() {
    }

    public void getConnect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yazlabproje", "root", "");
            System.out.println("Veritabanına Bağlandı.");

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Veritabanına Bağlanamadı." + e);

        }

    }

    public void userGuncelle(String uN, String uM, String uP, String usId) {
        try {
            String query = "UPDATE users SET userName='" + uN + "', userMail='" + uM + "', userPass='" + uP + "' WHERE userId='" + usId + "'";
            Statement ifade = conn.createStatement();
            System.out.println(query);
            ifade.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void userEkle(String uN, String uM, String uP) {
        try {
            String query = "INSERT INTO users(userName,userMail,userPass) "
                    + "VALUES('" + uN + "','" + uM + "'," + "'" + uP + "')";

            Statement ifade = conn.createStatement();
            ifade.execute(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean tokenSorgula(String t) {
        try {
            String query4 = "SELECT *"
                    + " FROM adminTokens WHERE aToken='" + t + "'";

            Statement ifade4 = conn.createStatement();
            ResultSet rs4 = ifade4.executeQuery(query4);
            if (!rs4.isBeforeFirst()) {
                System.out.println("Bilgiler database ile eşleşmiyor.");
                return false;
            }
            System.out.println("Bilgiler doğru devam ediliyor.");
            while (rs4.next()) {

                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public void tezleriEkle1(String tezUserId, String tezTur, String tezKonu, String tezDonem, String tezOzet, ArrayList<String> tezA, String tezDosyaAd) {
        String tezAnaht = "";
        try {
            for (int i = 0; i < tezA.size(); i++) {
                String s = tezA.get(i);
                tezAnaht += s;

            }
            String query = "INSERT INTO tezler(tezYukleyenId,tezTur,tezKonu,tezDonem,tezOzet,tezAnahtarKelimeler,tezDosyaAd) "
                    + "VALUES('" + tezUserId + "','" + tezTur + "','" + tezKonu + "','" + tezDonem + "','" + tezOzet + "','" + tezAnaht + "','" + tezDosyaAd + "')";

            Statement ifade = conn.createStatement();
            ifade.execute(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void tezleriEkle2(String tezId, String tezDanisman) {
        try {
            String query = "INSERT INTO danismanlar(danismanTezId,danismanName) "
                    + "VALUES('" + tezId + "','" + tezDanisman + "')";

            Statement ifade = conn.createStatement();
            ifade.execute(query);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void tezleriEkle3(String tezId, String tezJuri) {
        try {

            String query1 = "INSERT INTO juriler(juriTezId,juriName) "
                    + "VALUES('" + tezId + "','" + tezJuri + "')";
            System.out.println(query1);

            Statement ifade = conn.createStatement();
            ifade.execute(query1);

        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void tezleriEkle4(String tezId, String tezOgrAd, String tezOgrNo, String tezOgrTur) {
        try {

            String query1 = "INSERT INTO tezogrenci(tezOgrencıTezId,tezOgrenciAd,tezOgrenciNo,tezOgrenciTur) "
                    + "VALUES('" + tezId + "','" + tezOgrAd + "','" + tezOgrNo + "','" + tezOgrTur + "')";
            System.out.println(query1);

            Statement ifade = conn.createStatement();
            ifade.execute(query1);

        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void tezleriEkle5(String tezId, String anahtar) {
        try {

            String query1 = "INSERT INTO tezanahtarlar(tezAnahtarTezId,tezAnahtarKelime) "
                    + "VALUES('" + tezId + "','" + anahtar + "')";
            System.out.println(query1);

            Statement ifade = conn.createStatement();
            ifade.execute(query1);

        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String tezIdAl(String tezKonu) {
        String stringId = null;
        try {
            String query4 = "SELECT *"
                    + " FROM tezler WHERE tezKonu='" + tezKonu + "'";

            Statement ifade4 = conn.createStatement();
            ResultSet rs4 = ifade4.executeQuery(query4);
            if (!rs4.isBeforeFirst()) {
                System.out.println("Bilgiler database ile eşleşmiyor.");
                return stringId;
            }
            System.out.println("Bilgiler doğru devam ediliyor.");
            while (rs4.next()) {
                String a = rs4.getString("tezId");
                stringId = a;

            }

        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stringId;

    }

    public boolean loginSorgula(String uMail, String uPass) {
        User user;
        try {
            String query4 = "SELECT *"
                    + " FROM users WHERE userMail='" + uMail + "' && userPass='" + uPass + "'";

            Statement ifade4 = conn.createStatement();
            ResultSet rs4 = ifade4.executeQuery(query4);
            if (!rs4.isBeforeFirst()) {
                System.out.println("Bilgiler database ile eşleşmiyor.");
                return false;
            }
            System.out.println("Bilgiler doğru devam ediliyor.");
            while (rs4.next()) {
                int a = Integer.parseInt(rs4.getString("userId"));
                String b = rs4.getString("userName");
                String c = rs4.getString("userMail");
                String d = rs4.getString("userPass");
                user = new User(a, b, c, d);
                this.setUserObjesi(user);

            }
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;

    }

    public User getUserObjesi() {
        return userObjesi;
    }

    public void setUserObjesi(User userObjesi) {
        this.userObjesi = userObjesi;
    }

}
