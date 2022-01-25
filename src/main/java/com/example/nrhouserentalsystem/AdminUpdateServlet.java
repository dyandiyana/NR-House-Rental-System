package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "AdminUpdateServlet", value = "/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int adminid= Integer.parseInt(request.getParameter("adminid"));
        String adminusername = request.getParameter("adminusername");
        String adminpassword = request.getParameter("adminpassword");
        String adminname = request.getParameter("adminname");
        String adminemail = request.getParameter("adminemail");
        String adminage = request.getParameter("adminage");
        String admingender = request.getParameter("admingender");
        String adminphonenumber = request.getParameter("adminphonenumber");

        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""


            //nk testing keluar masuk data pastikan xampp, heroku , database connected

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw"; //ni user dri heroku database
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database


            Connection conn = DriverManager.getConnection(dbURL, user, pass);
            // klau buat postgress atas2 ni amik yg details dri heroku



            String query="UPDATE admin set adminusername=?,adminpassword=?,adminname=?,adminemail=?,adminage=?,admingender=?,adminphonenumber=? " +
                    "where adminid=?";

            PreparedStatement st = conn.prepareStatement(query);
            //paramter tu no column dlm table.sdId1 tu dri nama attribute kat String atas tu

            st.setString(1,adminusername);
            st.setString(2,adminpassword);
            st.setString(3,adminname);
            st.setString(4,adminemail);
            st.setString(5,adminage);
            st.setString(6,admingender);
            st.setString(7,adminphonenumber);
            st.setInt(8,adminid);
            int row= st.executeUpdate();//return no of row effected

            if(row>0){
                out.println("Record update insertedd");

                request.setAttribute("adminid",adminid);
                request.setAttribute("adminusername",adminusername );
                request.setAttribute("adminpassword", adminpassword);
                request.setAttribute("adminemail", adminemail);
                request.setAttribute("adminage", adminage);
                request.setAttribute("admingender", admingender);
                request.setAttribute("adminphonenumber", adminphonenumber);

                RequestDispatcher rd = request.getRequestDispatcher("admin-viewProfile.jsp");
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
