package com.example.nrhouserentalsystem;



import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

public class BookingDao {

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

    public void create(Tenant tenant, House house, Landlord landlord) throws Exception{
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into BOOKINGDETAILS(TENANTID,HOUSEID,landlordid) values(?,?,?)");)
        {

            preparedStatement.setInt(1, tenant.getTenantId());
            preparedStatement.setInt(2, house.getHouseid());
            preparedStatement.setInt(3, landlord.getLandlordId());

            out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            printSQLException(e);
        }
    }
    public void update(Part f,Part fi,int bookingid) throws SQLException, FileNotFoundException {


        String imageFileName = f.getSubmittedFileName();
        File file = new File("C:/Users/TOSHIBA/IdeaProjects/ICT502-NRRENTAL/src/main/webapp/dyana/" + imageFileName);
        System.out.println("my file need upload" + file);

        String imageFileName2 = fi.getSubmittedFileName();
        File file2 = new File("C:/Users/TOSHIBA/IdeaProjects/ICT502-NRRENTAL/src/main/webapp/dyana/" + imageFileName2);

        try {
            FileOutputStream fos = new FileOutputStream(file);
            InputStream is = f.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

            FileOutputStream fos2 = new FileOutputStream(file2);
            InputStream is2 = fi.getInputStream();

            byte[] data2 = new byte[is2.available()];
            is2.read(data2);
            fos2.write(data2);
            fos2.close();

        } catch (Exception e) {
            e.printStackTrace();
        }


        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE BOOKINGDETAILS SET BOOKINGDEPO=?,DEPODOC=?,BOOKINGAGREEMENT=?,AGREEDOC=? WHERE BOOKINGID=?");) {
            FileInputStream fis = new FileInputStream(file);
            FileInputStream fis2 = new FileInputStream(file2);
            statement.setBinaryStream(2, fis, file.length());
            statement.setString(1, file.getName());

            statement.setBinaryStream(4, fis2, file2.length());
            statement.setString(3, file2.getName());
            statement.setInt(5,bookingid);

            statement.executeUpdate();
        }
    }

    public boolean deletebooking(int bookingid) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from BOOKINGDETAILS where BOOKINGID=?");) {
            statement.setInt(1, bookingid);
            rowDeleted = statement.executeUpdate() > 0;

        }
        return rowDeleted;
    }

    public void approvedbooking(int bookingid,Part f) throws SQLException {
        String status="Approved";


        String imageFileName = f.getSubmittedFileName();
        File file = new File("src/main/webapp/images/" + imageFileName);

        try (Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement("UPDATE BOOKINGDETAILS SET BOOKINGSTATUS=?,BOOKINGAPPROVALDATE=localtimestamp,AGREEDOC=?,BOOKINGAGREEMENT=? WHERE BOOKINGID=?");) {
            FileOutputStream fos = new FileOutputStream(file);
            InputStream is = f.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
            FileInputStream fis = new FileInputStream(file);

            statement.setString(1, status);
            statement.setBinaryStream(2, fis, file.length());
            statement.setString(3, file.getName());
            statement.setInt(4, bookingid);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
