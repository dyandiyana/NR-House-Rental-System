package com.example.nrhouserentalsystem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

@WebServlet(name = "LAdisplayInUpdateServlet", value = "/LAdisplayInUpdateServlet")
public class LAdisplayInUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int housenum = 0;
        String housenama=null;
        double housemonth= 0.0;
        String houseadd=null;
        String houseloc=null;
        String available=null;
        int hnotenant=0;
        int hnoroom=0;
        int hnotoilet=0;
        int hnoac=0;
        boolean wifi=false;
        int furnish=0;
        int washing=0;
        String housedesc=null;
        String housepic=null;
        int landid = 0;
        Date d= new Date();



        try{

            int hids = Integer.parseInt(request.getParameter("hid"));


            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-44-194-101-60.compute-1.amazonaws.com:5432/d2us57cbf117bh"; //ni url dri heroku database
            String user = "rnscsqosqdtcmz"; //ni user dri heroku database
            String pass = "0b201fb2e59025b780ce0b4148e508b6747fbaf77f6e8cedc675ee4dbc44638a"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);


            PreparedStatement pst = conn.prepareStatement("select * from housedetails where houseid=?");
            pst.setInt(1,hids);


            ResultSet rs= pst.executeQuery();//return no of row effected

            //if nk pastikan yg key hntr tu sama dgn key yg kita ada dalam table
            while (rs.next()){
                if(rs.getInt("houseid") == hids)
                {
                    housenum = rs.getInt("houseid");
                    housenama = rs.getString("housename");
                    housemonth = rs.getDouble("housemonthlyprice");
                    houseadd=rs.getString("houseaddress");
                    houseloc= rs.getString("houselocation");
                    d=rs.getDate("housepublishdate");
                    available= rs.getString("houseavailability");
                    hnotenant=rs.getInt("housenotenants");
                    hnoroom=rs.getInt("housenoroom");
                    hnotoilet=rs.getInt("housenotoilet");
                    hnoac=rs.getInt("housenoac");
                    wifi=rs.getBoolean("housewifi");
                    furnish=rs.getInt("housefurniture");
                    washing=rs.getInt("housewm");
                    housedesc= rs.getString("housedescription");
                    housepic=rs.getString("housepicname");
                    landid=rs.getInt("landlordid");

                }
            }

        }catch(Exception e){
            System.out.println(e);
        }

        //pass to jsp to get the attribute
        RequestDispatcher rd;

        request.setAttribute("hids",String.valueOf(housenum)); // nama hid bleh tukar nk pape
        request.setAttribute("hnames",housenama);
        request.setAttribute("hpaymonth",String.valueOf(housemonth));
        request.setAttribute("haddress",houseadd);
        request.setAttribute("houseloc",houseloc);
        request.setAttribute("hpdate",d);// date tukar ke date
        request.setAttribute("hava",available);
        request.setAttribute("hnoT",String.valueOf(hnotenant));
        request.setAttribute("hnoR",String.valueOf(hnoroom));
        request.setAttribute("hnoToil",String.valueOf(hnotoilet));
        request.setAttribute("hnoAC",String.valueOf(hnoac));
        request.setAttribute("hnoWifi",String.valueOf(wifi));
        request.setAttribute("hnoFur",String.valueOf(furnish));
        request.setAttribute("hnoWM",String.valueOf(washing));
        request.setAttribute("hdec",String.valueOf(housedesc));
        request.setAttribute("hpic",String.valueOf(housepic));
        request.setAttribute("landid",String.valueOf(landid));



        rd= request.getRequestDispatcher("landlord-updateHouseDetails.jsp"); // redirect ke page jsp ni
        rd.forward(request,response); // past control ke file jsp

    }

}
