package com.example.nrhouserentalsystem;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig
@WebServlet(name = "LAupdateHouseDetailsServlet", value = "/LAupdateHouseDetailsServlet")
public class LAupdateHouseDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Part f=request.getPart("hPic");
        String imageFileName=f.getSubmittedFileName();
        File file = new File("C:/Users/Public/LAB EXERCISE/nonresident/src/main/webapp/images/" + imageFileName);
        System.out.println("my file need upload" + file);


        int hids = Integer.parseInt(request.getParameter("hid"));
        //int landid = Integer.parseInt(request.getParameter("landid"));

        try{

            String hName    = request.getParameter("hName");
            Double hMP     = Double.parseDouble(request.getParameter("Pricepm"));
            String hAddress = request.getParameter("hAddress");
            String hloc    = request.getParameter("hloc");
            String hAvailability = request.getParameter("hAvailability");
            int hNoTenants = Integer.parseInt( request.getParameter("NumOfTenant"));
            int hNoRoom = Integer.parseInt(request.getParameter("NumOfRooms"));
            int hNoToilet = Integer.parseInt(request.getParameter("NumOfToilet"));
            int hNoAC = Integer.parseInt(request.getParameter("NumOfAC"));
            boolean hWifi = Boolean.parseBoolean(request.getParameter("hWifi"));
            int hFurniture = Integer.parseInt(request.getParameter("NumOfSofa"));
            int hWM = Integer.parseInt(request.getParameter("NumOfWM"));
            String desc = request.getParameter("Desc");

            try {

                //for picture
                FileOutputStream fos = new FileOutputStream(file);
                InputStream is = f.getInputStream();

                byte[] data=new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();

            }catch (Exception e){
                e.printStackTrace();
            }

            try {
            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-44-194-101-60.compute-1.amazonaws.com:5432/d2us57cbf117bh"; //ni url dri heroku database
            String user = "rnscsqosqdtcmz"; //ni user dri heroku database
            String pass = "0b201fb2e59025b780ce0b4148e508b6747fbaf77f6e8cedc675ee4dbc44638a"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement pst = conn.prepareStatement("UPDATE housedetails SET housename=?,housemonthlyprice=?,houseaddress=?,houselocation=?,housepublishdate=localtimestamp,houseavailability=?,housenotenants=?,housenoroom=?,housenotoilet=?,housenoac=?,housewifi=?,housefurniture=?,housewm=?,housedescription=?,housepicname=? WHERE houseid = ?");
                pst.setString(1,hName);
                pst.setDouble(2,hMP);
                pst.setString(3,hAddress);
                pst.setString(4,hloc);
                pst.setString(5,hAvailability);
                pst.setInt(6,hNoTenants);
                pst.setInt(7,hNoRoom);
                pst.setInt(8,hNoToilet);
                pst.setInt(9,hNoAC);
                pst.setBoolean(10,hWifi);
                pst.setInt(11,hFurniture);
                pst.setInt(12,hWM);
                pst.setString(13,desc);
                pst.setString(14,imageFileName);
                pst.setInt(15,hids);
            //pst.setInt(1,landid);

                pst.executeUpdate();

//            while (rs.next()){
//                if(rs.getInt("houseid") == hids)
//                {
//                    pst.setString(1,hName);
//                    pst.setDouble(2,hMP);
//                    pst.setString(3,hAddress);
//                    pst.setString(4,hloc);
//                    pst.setString(5,hAvailability);
//                    pst.setInt(6,hNoTenants);
//                    pst.setInt(7,hNoRoom);
//                    pst.setInt(8,hNoToilet);
//                    pst.setInt(9,hNoAC);
//                    pst.setBoolean(10,hWifi);
//                    pst.setInt(11,hFurniture);
//                    pst.setInt(12,hWM);
//                    pst.setString(13,desc);
//                    pst.setString(14,imageFileName);
//
//                }
//            }


            }catch (Exception e){
                e.printStackTrace();
            }

        }catch(Exception e){
            System.out.println(e);
        }

        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your details succesfully updated.');");
        out.println("location='landlord-displayHouseList.jsp';");
        out.println("</script>");
    }
}
