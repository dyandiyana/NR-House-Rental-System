package com.example.nrhouserentalsystem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "UpdateLandlordServlet", value = "/UpdateLandlordServlet")
public class UpdateLandlordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int lId= Integer.parseInt(request.getParameter("landlordid"));
        String lUsername = request.getParameter("landlordusername");
        String lPassword = request.getParameter("landlordpassword");
        String lName = request.getParameter("landlordname");
        String lEmail = request.getParameter("landlordemail");
        String lAge = request.getParameter("landlordage");
        String lPhoneNo = request.getParameter("landlordPhoneNo");
        String lGender = request.getParameter("landlordgender");

        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""


            //nk testing keluar masuk data pastikan xampp, heroku , database connected

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/d6u31lk8tofpbt"; //ni url dri heroku database
            String user = "nhydysucefvvzn"; //ni user dri heroku database
            String pass = "d91c6a95779ab44ec2939ae0225389a20d7129541e10791714dbf4f165e0d078"; //ni password dri heroku database


            Connection conn = DriverManager.getConnection(dbURL, user, pass);
            // klau buat postgress atas2 ni amik yg details dri heroku



            String query="UPDATE landlord set landlordusername=?,landlordpassword=?,landlordname=?,landlordemail=?,landlordage=?,landlordphoneno=?,landlordgender=? " +
                    "where landlordid=?";

            PreparedStatement st = conn.prepareStatement(query);
            //paramter tu no column dlm table.sdId1 tu dri nama attribute kat String atas tu

            st.setString(1,lUsername);
            st.setString(2,lPassword);
            st.setString(3,lName);
            st.setString(4,lEmail);
            st.setString(5,lAge);
            st.setString(6,lPhoneNo);
            st.setString(7,lGender);
            st.setInt(8,lId);
            int row= st.executeUpdate();//return no of row effected

            if(row>0){
                out.println("Record update insertedd");

                request.setAttribute("landlordid",lId);
                request.setAttribute("landlordusername",lUsername );
                request.setAttribute("landlordpassword", lPassword);
                request.setAttribute("landlordname", lName);
                request.setAttribute("landlordemail", lEmail);
                request.setAttribute("landlordage", lAge);
                request.setAttribute("landlordphonenumber", lPhoneNo);
                request.setAttribute("landlordgender",lGender);

                RequestDispatcher rd = request.getRequestDispatcher("landlord-viewProfile.jsp");
                rd.forward(request, response);

                /*response.sendRedirect("landlord-viewProfile.jsp");*/
            }else{
                out.println("Record failed");
            }



        }catch(Exception e){
            e.printStackTrace();
        }



    }
}
