package com.example.nrhouserentalsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "LoginLandlordServlet", value = "/LoginLandlordServlet")
public class LoginLandlordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""


            String lUsername = request.getParameter("landlordUsername");
            String lPassword = request.getParameter("landlordPassword");

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/d6u31lk8tofpbt"; //ni url dri heroku database
            String user = "nhydysucefvvzn"; //ni user dri heroku database
            String pass = "d91c6a95779ab44ec2939ae0225389a20d7129541e10791714dbf4f165e0d078"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from landlord";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());

                HttpSession session = request.getSession();
                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(lUsername.equals(res.getString("landlordusername")) && lPassword.equals(res.getString("landlordpassword")))
                    {
                        session.setAttribute("landlordid",res.getString(1));
                        session.setAttribute("landlordusername",res.getString(2));
                        session.setAttribute("landlordpassword",res.getString(3));
                        session.setAttribute("landlordname",res.getString(4));
                        session.setAttribute("landlordemail",res.getString(5));
                        session.setAttribute("landlordage",res.getString(6));
                        session.setAttribute("landlordphoneno",res.getString(7));
                        session.setAttribute("landlordgender",res.getString(8));

                        response.sendRedirect("landlord-home.jsp");

                    }else{
                        out.println("HAHAHAHHA SALAH ");
                    }
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
