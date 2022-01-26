package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "TenantUpdateServlet", value = "/TenantUpdateServlet")
public class TenantUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int lId= Integer.parseInt(request.getParameter("tenantid"));
        String lUsername = request.getParameter("tenantusername");
        String lPassword = request.getParameter("tenantpassword");
        String lName = request.getParameter("tenantname");
        String lEmail = request.getParameter("tenantemail");
        String lAge = request.getParameter("tenantage");
        String lPhoneNo = request.getParameter("tenantphoneno");
        String lGender = request.getParameter("tenantgender");

        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""


            //nk testing keluar masuk data pastikan xampp, heroku , database connected

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw"; //ni user dri heroku database
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database


            Connection conn = DriverManager.getConnection(dbURL, user, pass);
            // klau buat postgress atas2 ni amik yg details dri heroku



            String query="UPDATE tenant set tenantusername=?,tenantpassword=?,tenantname=?,tenantemail=?,tenantage=?,tenantphoneno=?,tenantgender=? " +
                    "where tenantid=?";

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

                request.setAttribute("tenantid",lId);
                request.setAttribute("tenantusername",lUsername );
                request.setAttribute("tenantpassword", lPassword);
                request.setAttribute("tenantname", lName);
                request.setAttribute("tenantemail", lEmail);
                request.setAttribute("tenantage", lAge);
                request.setAttribute("tenantphoneno", lPhoneNo);
                request.setAttribute("tenantgender",lGender);

                RequestDispatcher rd = request.getRequestDispatcher("tenant-viewProfile.jsp");
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
