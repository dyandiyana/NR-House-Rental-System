package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import static java.lang.System.out;

@WebServlet(name = "deleteServlet", value = "/deleteServlet")
public class deleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session= request.getSession();


        try
        {
            int id = Integer.parseInt(session.getAttribute("landlordid").toString());
            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw";
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            Statement stmt = conn.createStatement();
            String sql = "delete from landlord where landlordid=?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,id);
            stmt.execute(sql);

            int row= st.executeUpdate();

            out.println("Your Requested Data Is Deleted");
            conn.close();

        }

        catch (Exception e)
        {
            out.println("Error: " + e.toString());

        }

    }
}
