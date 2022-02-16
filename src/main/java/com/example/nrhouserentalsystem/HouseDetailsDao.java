package com.example.nrhouserentalsystem;

import javax.servlet.http.Part;
import java.io.*;
import java.sql.*;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static java.lang.System.out;
@MultipartConfig
public class HouseDetailsDao {

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


    public void createhouse(HouseDetails house, Part f) throws SQLException, IOException {

        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("insert into housedetails(housename,housemonthlyprice,houseaddress,houselocation,housepublishdate,houseavailability,housenotenants,housenoroom,housenotoilet,housenoac,housewifi,housefurniture,housewm,housedescription,landlordid) values(?,?,?,?,localtimestamp,?,?,?,?,?,?,?,?,?,?)");)
        {

            ps.setString(1, house.gethName());
            ps.setDouble(2, house.gethMP());
            ps.setString(3, house.gethAddress());
            ps.setString(4, house.getHlocation());
            ps.setString(5, house.gethAvailability());
            ps.setInt(6, house.gethNoTenants());
            ps.setInt(7, house.gethNoRoom());
            ps.setInt(8, house.gethNoToilet());
            ps.setInt(9, house.gethNoAC());
            ps.setString(10, house.gethWifi());
            ps.setInt(11, house.gethFurniture());
            ps.setInt(12, house.gethWM());
            ps.setString(13, house.getDesc());
            ps.setInt(14, house.getLandlordID());
            ps.executeUpdate();

        }

        int idhouse=0;
        try (Connection connection = getConnection();
             PreparedStatement ps3 = connection.prepareStatement("select max(houseid) from housedetails");)
        {
            ResultSet rs = ps3.executeQuery();
            while(rs.next()){
                idhouse = rs.getInt(1);
            }
        }


        String FileName=f.getSubmittedFileName();
        File file = new File("src/main/webapp/images/"+ FileName);
        try{
            FileOutputStream fos = new FileOutputStream(file);
            InputStream is = f.getInputStream();

            byte[] data=new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        try (Connection connection = getConnection();
             PreparedStatement ps2 = connection.prepareStatement("insert into houseimages(houseid,housepic,houseimagespic) values(?,?,?)");)
        {
            FileInputStream fis = new FileInputStream(file);
            ps2.setInt(1, idhouse);
            ps2.setBinaryStream(2, fis, file.length());
            ps2.setString(3, file.getName());
            ps2.executeUpdate();

        }


        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatehouse(HouseDetails house, Part f,Integer landid) throws SQLException, IOException {

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE housedetails SET housename=?,housemonthlyprice=?,houseaddress=?,houselocation=?,housepublishdate=localtimestamp,houseavailability=?,housenotenants=?,housenoroom=?,housenotoilet=?,housenoac=?,housewifi=?,housefurniture=?,housewm=?,housedescription=?,housepicname=? WHERE houseid = ?");)
        {

            ps.setString(1, house.gethName());
            ps.setDouble(2, house.gethMP());
            ps.setString(3, house.gethAddress());
            ps.setString(4, house.getHlocation());
            ps.setString(5, house.gethAvailability());
            ps.setInt(6, house.gethNoTenants());
            ps.setInt(7, house.gethNoRoom());
            ps.setInt(8, house.gethNoToilet());
            ps.setInt(9, house.gethNoAC());
            ps.setString(10, house.gethWifi());
            ps.setInt(11, house.gethFurniture());
            ps.setInt(12, house.gethWM());
            ps.setString(13, house.getDesc());
            ps.setInt(14, house.getLandlordID());
            ps.setInt(15, house.gethID());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        int idhouse=0;
        try (Connection connection = getConnection();
             PreparedStatement ps2 = connection.prepareStatement("select max(houseid) from housedetails");)
        {
            ResultSet rs = ps2.executeQuery();
            while(rs.next()){
                idhouse = rs.getInt(1);
            }
        }

        String FileName=f.getSubmittedFileName();
        File file = new File("src/main/webapp/images/"+ FileName);
        FileOutputStream fos = new FileOutputStream(file);
        InputStream is = f.getInputStream();

        byte[] data=new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();

        try (Connection connection = getConnection();
             PreparedStatement ps2 = connection.prepareStatement("UPDATE houseimages SET houseid=?,housepic=?,houseimagespic=? WHERE houseid = ?");)
        {
            FileInputStream fis = new FileInputStream(file);
            ps2.setInt(1, idhouse);
            ps2.setBinaryStream(2, fis, file.length());
            ps2.setString(3, file.getName());
            ps2.setInt(4, idhouse);
            ps2.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deletehouse(Integer houseid, Integer landid) throws SQLException, IOException {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("DELETE FROM housedetails WHERE houseid = ? AND landlordid= ?");)
        {
            ps.setInt(1,houseid);
            ps.setInt(1,landid);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
