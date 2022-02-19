package com.example.nrhouserentalsystem;

import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MonthlyPaymentDao {
    String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"; //ni url dri heroku database
    String user = "gpdkvocjaztxrw";
    String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
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

    public void createPay(MonthlyPayment monthlyPayment, int bookingid) throws SQLException, FileNotFoundException {


        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO MONTHLYPAYMENT (PAYPRICE,MONTH,PAYDUEDATE,BOOKINGID) VALUES (?,?,?,?)");) {

            statement.setDouble(1, monthlyPayment.getPayPrice());
            statement.setString(2,monthlyPayment.getMonth());
            statement.setDate(3, monthlyPayment.getPayDueDate());
            statement.setInt(4,bookingid);

            statement.executeUpdate();

        } catch (Exception e) {
        e.printStackTrace();
        }
    }

    public void rentComplete(int bookingid) throws SQLException, FileNotFoundException {


        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE BOOKINGDETAILS SET RENTALSTATUS='Completed' WHERE bookingid=?");) {
            statement.setInt(1,bookingid);

            statement.executeUpdate();
        }  catch (Exception e) {
        e.printStackTrace();
        }
    }

    public void verifyPay(int payId) throws SQLException, FileNotFoundException {


        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE MONTHLYPAYMENT SET PAYSTATUS='Paid' WHERE payid=?");) {
            statement.setInt(1,payId);

            statement.executeUpdate();
        }  catch (Exception e) {
        e.printStackTrace();
        }
    }

    public void rejectPay(int payId) throws SQLException, FileNotFoundException {


        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE MONTHLYPAYMENT SET PAYSTATUS='Unpaid' WHERE payid=?");) {
            statement.setInt(1,payId);

            statement.executeUpdate();
        }  catch (Exception e) {
         e.printStackTrace();
        }
    }


}
