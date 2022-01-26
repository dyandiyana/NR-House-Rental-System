package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "TenantLoginServlet", value = "/TenantLoginServlet")
public class TenantLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();


        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""


            String lUsername = request.getParameter("tenantusername");
            String lPassword = request.getParameter("tenantpassword");

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw"; //ni user dri heroku database
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from tenant";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(lUsername.equals(res.getString("tenantusername")) && lPassword.equals(res.getString("tenantpassword")))
                    {
                        session.setAttribute("tenantid",res.getString(1));
                        session.setAttribute("tenantusername",res.getString(2));
                        session.setAttribute("tenantpassword",res.getString(3));
                        session.setAttribute("tenantname",res.getString(4));
                        session.setAttribute("tenantemail",res.getString(5));
                        session.setAttribute("tenantage",res.getString(6));
                        session.setAttribute("tenantphoneno",res.getString(7));
                        session.setAttribute("tenantgender",res.getString(8));



                        response.sendRedirect("tenant-homepage.jsp");

                    }else{
                        out.println("User not exist");
                    }
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }




    }
}
