package com.example.nrhouserentalsystem;

import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

public class MonthlyPaymentDao {
    String dbURL = "jdbc:oracle:thin:@localhost:1521:XE"; //ni url dri heroku database
    String user = "RENTALSYSTEM";
    String pass = "system";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection= DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    public void update(Part f, int payid) throws SQLException, FileNotFoundException {


        String imageFileName = f.getSubmittedFileName();
        File file = new File("C:/Users/TOSHIBA/IdeaProjects/ICT502-NRRENTAL/src/main/webapp/dyana/" + imageFileName);
        System.out.println("my file need upload" + file);

        try {
            FileOutputStream fos = new FileOutputStream(file);
            InputStream is = f.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
        }


        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE MONTHLYPAYMENT SET PAYRECEIPT=?,PAYDOC=? WHERE PAYID=?");) {
            FileInputStream fis = new FileInputStream(file);
            statement.setBinaryStream(2, fis, file.length());
            statement.setString(1, file.getName());
            statement.setInt(3,payid);

            statement.executeUpdate();
        }
    }
}
